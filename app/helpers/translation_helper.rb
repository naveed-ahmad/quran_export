module TranslationHelper
  TEXT_SANITIZER = Rails::Html::WhiteListSanitizer.new

  def translation_text_with_inline_footnotes(translaiton)
    text = translaiton.text

    translaiton.foot_notes.each do |f|
      reg = /<sup foot_note=#{f.id}>\d+<\/sup>/
      text = text.gsub(reg) do
        "<span class='footnote'>#{TEXT_SANITIZER.sanitize(f.text, tags: %w(), attributes: [])}</span>"
      end
    end

    text.html_safe
  end

  def load_verses(chapter)
    chapter
        .verses
        .where(translations: {resource_content_id: 131}, tafsirs: {resource_content_id: 171})
        .eager_load(:translation, :tafsir)
  end
end