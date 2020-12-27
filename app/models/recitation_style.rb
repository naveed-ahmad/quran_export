class RecitationStyle < QuranApiRecord
  has_many :translated_names, as: :resource

  def name
    self.style
  end
end
