class Word < QuranApiRecord
  default_scope { order 'position asc' }
  scope :words, -> { where char_type_id: 1 }

  belongs_to :verse
  has_many :word_translations

  def code
    "&#x#{code_hex};"
  end

  def code_v3
    "&#x#{code_hex_v3};"
  end
end
