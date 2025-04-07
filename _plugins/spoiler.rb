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
        var body = el.querySelector('.spoiler-body');
        if (el.classList.contains('closing')) return;
        if (el.classList.contains('open')) {
          el.classList.add('closing');
          body.style.maxHeight = body.scrollHeight + 'px';
          requestAnimationFrame(function() {
            body.style.maxHeight = '0px';
            body.addEventListener('transitionend', function handler(e) {
              if (e.propertyName === 'max-height') {
                el.classList.remove('open');
                el.classList.remove('closing');
                body.style.display = 'none';
                body.removeEventListener('transitionend', handler);
              }
            });
          });
        } else {
          body.style.display = 'block';
          body.style.maxHeight = body.scrollHeight + 'px';
          el.classList.add('open');
        }
      JS
      
      onclick_close_js = <<~JS.gsub(/\s+/, ' ').strip
        var el = document.getElementById('#{spoiler_id}');
        var body = el.querySelector('.spoiler-body');
        var summary = el.querySelector('.spoiler-summary');
        if (!el.classList.contains('open') || el.classList.contains('closing')) return;
        
        var targetOffset = summary.getBoundingClientRect().top + window.scrollY - 100;
        
        function doClose() {
          el.classList.add('closing');
          body.style.maxHeight = body.scrollHeight + 'px';
          requestAnimationFrame(function() {
            body.style.maxHeight = '0px';
            body.addEventListener('transitionend', function handler(e) {
              if (e.propertyName === 'max-height') {
                el.classList.remove('open');
                el.classList.remove('closing');
                body.style.display = 'none';
                body.removeEventListener('transitionend', handler);
              }
            });
          });
        }
        
        var lastScrollY = window.scrollY;
        window.scrollTo({ top: targetOffset, behavior: 'smooth' });
        
        var scrollCheck = setInterval(function() {
          if (Math.abs(window.scrollY - targetOffset) < 4 || window.scrollY === lastScrollY) {
            clearInterval(scrollCheck);
            doClose();
          }
          lastScrollY = window.scrollY;
        }, 50);
      JS
      
      close_footer_html = %Q|<div class="spoiler-close-footer" onclick="#{onclick_close_js}" role="button" aria-label="Згорнути спойлер" tabindex="0"><span class="spoiler-close-icon" aria-hidden="true"></span>Згорнути</div>|
      
      output = <<~HTML
        <div class="spoiler" id="#{spoiler_id}">
          <div class="spoiler-summary" role="button" tabindex="0" onclick="#{onclick_toggle_js}">
            #{@title}
          </div>
          <div class="spoiler-body" style="max-height: 0; display: none;">
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
