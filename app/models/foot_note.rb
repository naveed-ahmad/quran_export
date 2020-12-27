class FootNote < QuranApiRecord
  belongs_to :translation
  belongs_to :language
  belongs_to :resource_content
end
