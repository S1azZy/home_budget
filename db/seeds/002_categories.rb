# frozen_string_literal: true

data = [
  ["no_category", "Без категории"],
  ["restaurants", "Кафе, рестораны"],
  ["shopping", "Покупки"],
  ["transport", "Транспорт"],
  ["travel", "Путешествия"]
]

data.each do |(slug, name)|
  category = Category.find_or_initialize_by(slug:)
  category.update!(name:)
end
