class Tafsir < QuranApiRecord
  belongs_to :verse
  belongs_to :language
  belongs_to :resource_content
end
