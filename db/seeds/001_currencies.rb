# frozen_string_literal: true

path = Rails.root.join("vendor/currencies.json").to_path
currencies = Oj.load_file(path)

currencies.each_pair do |code, currency_attrs|
  currency = Currency.find_or_initialize_by(code: code)
  currency.update!(
    name: currency_attrs["name"],
    symbol: currency_attrs["symbol"],
    symbol_native: currency_attrs["symbol_native"]
  )
end
