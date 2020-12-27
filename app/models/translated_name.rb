class TranslatedName < QuranApiRecord
  belongs_to :language
  belongs_to :resource, polymorphic: true
end
