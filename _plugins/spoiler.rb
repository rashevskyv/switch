require 'kramdown'
require 'securerandom'

module Jekyll
  class SpoilerTag < Liquid::Block
    def initialize(tag_name, title, tokens)
      super
      @title = title.strip
      @title = "Спойлер" if @title.empty?
    end

    def render(context)
      site = context.registers[:site]
      converter = site.find_converter_instance(::Jekyll::Converters::Markdown)

      content = super.strip
      html_content = converter.convert(content)

      spoiler_id = "spoiler-#{SecureRandom.hex(4)}"

      onclick_toggle_js = <<~JS.gsub(/\s+/, ' ').strip
        var el = document.getElementById('#{spoiler_id}');
        if (el.classList.contains('closing')) return;
        if (el.classList.contains('open')) {
          el.classList.add('closing');
          requestAnimationFrame(function() {
            requestAnimationFrame(function() {
              el.classList.remove('open');
              el.classList.remove('closing');
            });
          });
        } else {
          el.classList.add('open');
        }
      JS

      onclick_close_js = <<~JS.gsub(/\s+/, ' ').strip
        var el = document.getElementById('#{spoiler_id}');
        if (!el.classList.contains('open') || el.classList.contains('closing')) return;
        el.classList.add('closing');
        requestAnimationFrame(function() {
          requestAnimationFrame(function() {
            el.classList.remove('open');
            el.classList.remove('closing');
            var shouldScroll = el.offsetHeight > window.innerHeight;
            if (shouldScroll) {
              el.scrollIntoView({ behavior: 'smooth', block: 'start' });
            }
          });
        });
      JS

      close_footer_html = %Q|<div class="spoiler-close-footer" onclick="#{onclick_close_js}" role="button" aria-label="Згорнути спойлер" tabindex="0"><span class="spoiler-close-icon" aria-hidden="true"></span>Згорнути</div>|

      output = <<~HTML
        <div class="spoiler" id="#{spoiler_id}">
          <div class="spoiler-summary" role="button" tabindex="0" onclick="#{onclick_toggle_js}">
            #{@title}
          </div>
          <div class="spoiler-body">
            <div class="spoiler-content">
              #{html_content}
            </div>
            #{close_footer_html}
          </div>
        </div>
      HTML

      output
    end
  end
end

Liquid::Template.register_tag('spoiler', Jekyll::SpoilerTag)
