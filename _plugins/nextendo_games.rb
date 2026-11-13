require "json"
require "net/http"

# site.data["nextendo_games"] = the games list of nextendo.network, read at every build.
# The site has no API for it and sends no CORS header, so a page script cannot read it: the list is the array
# PROGRES in https://nextendo.network/assets/js/rework.js ({nom, tid, pct, detail}; pct null = still in validation).
# A build never writes a tracked file (the release script checks out gh-pages right after the build): the fresh list
# lives in memory, dated with the day of the download. _data/nextendo_games.json is the fallback for a build with no
# network or a changed format; `NEXTENDO_SAVE=1 bundle exec jekyll build` refreshes it. One download per hour per process.
module NextendoGames
  URL = URI("https://nextendo.network/assets/js/rework.js")
  STR = '"((?:[^"\\\\]|\\\\.)*)"'
  ENTRY = /\{\s*"?nom"?\s*:\s*#{STR}\s*,\s*"?tid"?\s*:\s*"(\h{16})"\s*,\s*"?pct"?\s*:\s*(\d+|null)\s*,\s*"?detail"?\s*:\s*#{STR}\s*\}/

  def self.parse(js)
    block = js[/PROGRES\s*=\s*\[(.*?)\];/m, 1] or return nil
    games = block.scan(ENTRY).map do |name, tid, pct, detail|
      { "name" => JSON.parse("\"#{name}\""), "tid" => tid.downcase,
        "pct" => pct == "null" ? nil : pct.to_i, "detail" => JSON.parse("\"#{detail}\"") }
    end
    # fewer than ten parsed entries = the format changed; keep the old copy rather than publish a stub
    return nil if games.size < 10 || games.size < block.scan(/\btid\b/).size
    games.each_with_index.sort_by { |g, i| [-(g["pct"] || -1), i] }.map(&:first)
  end

  def self.fetch
    return @games if @at && Time.now - @at < 3600
    @at = Time.now
    res = Net::HTTP.start(URL.host, URL.port, use_ssl: true, open_timeout: 10, read_timeout: 10) { |h| h.get(URL.path) }
    @games = res.is_a?(Net::HTTPSuccess) ? parse(res.body.force_encoding("UTF-8")) : nil
  rescue StandardError => e
    Jekyll.logger.warn "nextendo_games:", e.message
    @games = nil
  end
end

Jekyll::Hooks.register :site, :post_read do |site|
  cache = File.join(site.source, "_data", "nextendo_games.json")
  games = NextendoGames.fetch
  # "updated" = the day this list was downloaded (the build day when the download worked)
  data = games ? { "updated" => Time.now.utc.strftime("%Y-%m-%d"), "games" => games } : site.data["nextendo_games"]
  File.write(cache, JSON.pretty_generate(data) + "\n", encoding: "UTF-8") if games && ENV["NEXTENDO_SAVE"]
  Jekyll.logger.warn "nextendo_games:", "no list (no network and no #{cache})" unless data
  site.data["nextendo_games"] = data if data
end
