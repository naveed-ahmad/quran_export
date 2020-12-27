class ResourceContent < QuranApiRecord
  scope :translations, -> { where sub_type: [SubType::Translation, SubType::Transliteration] }
  scope :tafsirs, -> { where sub_type: SubType::Tafsir }
  scope :chapter_info, -> { where sub_type: SubType::Info }
  scope :one_verse, -> { where cardinality_type: CardinalityType::OneVerse }
  scope :one_chapter, -> { where cardinality_type: CardinalityType::OneChapter }
  scope :approved, -> { where approved: true }
  
  belongs_to :language
  has_many :translated_names, as: :resource

  module CardinalityType
    OneVerse = '1_ayah'
    OneWord = '1_word'
    NVerse = 'n_ayah'
    OneChapter = '1_chapter'
  end

  module ResourceType
    Audio = 'audio'
    Content = 'content'
    Quran = 'quran'
    Media = 'media'
  end

  module SubType
    Translation = 'translation'
    Tafsir = 'tafsir'
    Transliteration = 'transliteration'
    Font = 'font'
    Image = 'image'
    Info = 'info'
    Video = 'video'
    Audio = 'audio'
  end

  def transliteration?
    sub_type == SubType::Transliteration
  end

  def translation?
    sub_type == SubType::Translation
  end

  def tafisr?
    sub_type == SubType::Tafsir
  end

  def chapter_info?
    sub_type == SubType::Info
  end

  def video?
    sub_type == SubType::Video
  end

  def recitation?
    sub_type == ResourceType::Audio || resource_type == ResourceType::Audio
  end
end
