require "time"

# page.seo_modified = time of the last git commit of the page source. The sitemap <lastmod> and
# JSON-LD dateModified use it: site.time marks every page as changed on every build, and Google
# ignores lastmod that is always "now". Files not in git keep the site.time fallback.
Jekyll::Hooks.register :site, :post_read do |site|
  site.pages.each do |page|
    t = `git -C "#{site.source}" log -1 --format=%cI -- "#{page.path}"`.strip
    page.data["seo_modified"] = Time.iso8601(t) unless t.empty?
  end
end
