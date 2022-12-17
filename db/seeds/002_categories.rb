# frozen_string_literal: true

data = [
  ["no_category", "Без категории"],
  ["restaurants", "Кафе, рестораны"],
  %w[shopping Покупки],
  %w[transport Транспорт],
  %w[travel Путешествия],
  ["utility", "Связь, интернет, ЖКУ"],
  %w[house Жилье],
  %w[entertainment Развлечения]
]

data.each do |(slug, name)|
  category = Category.find_or_initialize_by(slug:)
  category.update!(name:)
end
