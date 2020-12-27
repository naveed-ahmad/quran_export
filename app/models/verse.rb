class Verse < QuranApiRecord
  belongs_to :chapter, inverse_of: :verses, counter_cache: true
  has_many :tafsirs
  has_many :words
  has_many :translations
  has_many :audio_files
  has_many :recitations, through: :audio_files

  has_one :translation
  has_one :tafsir
end
