class Chapter < QuranApiRecord
  has_many :verses, inverse_of: :chapter
  has_many :translated_names, as: :resource
  has_one :translated_name, -> { where(language_id: 38) }, as: :resource

end
