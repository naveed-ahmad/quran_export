class Translation < QuranApiRecord
  belongs_to :verse
  belongs_to :language
  belongs_to :resource_content
  has_many :foot_notes
end
