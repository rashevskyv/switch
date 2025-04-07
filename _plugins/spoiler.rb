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

      # --- Оновлений JavaScript для закриття та скролу ---
      # Функція, яку буде викликати і summary (неявно) і кнопка/футер
      onclick_js = %Q|var el = document.getElementById('#{spoiler_id}'); if (!el.open) return; el.open = false; setTimeout(function(){ el.scrollIntoView({ behavior: 'smooth', block: 'start' }); }, 50);|
      # Додано перевірку if (!el.open) return; щоб не скролити, якщо вже закрито
      # Невелика затримка setTimeout може допомогти візуалізації закриття перед скролом

      # --- Кнопка "Згорнути" (якщо ще потрібна) ---
      # Якщо ця кнопка більше не потрібна, можна її видалити/закоментувати
      # collapse_button_html = %Q|<button type="button" class="spoiler-collapse-button" onclick="#{onclick_js}">Згорнути</button>|
      # Видаляємо кнопку, бо буде нижня панель

      # --- Елемент для закриття знизу ---
      # Використовуємо <div>, який буде стилізований як <summary>
      # Додаємо той самий onclick JavaScript
      close_footer_html = %Q|<div class="spoiler-close-footer" onclick="#{onclick_js}" role="button" aria-label="Згорнути спойлер" tabindex="0">#{@title} <span class="close-icon" aria-hidden="true"></span></div>|
      # Додано span для можливої іконки закриття/стрілки вгору через CSS

      # --- Фінальний HTML ---
      # Змінюємо структуру: кнопка Згорнути видалена, додано .spoiler-close-footer
      output = <<~HTML
        <details class="spoiler" id="#{spoiler_id}">
          <summary>#{@title}</summary>
          <div class="spoiler-content">
            #{html_content}
            
          </div>
          #{close_footer_html}
        </details>
      HTML

      output
    end
  end
end

Liquid::Template.register_tag('spoiler', Jekyll::SpoilerTag)