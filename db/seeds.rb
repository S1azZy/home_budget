# frozen_string_literal: true

Dir[Rails.root.join("db/seeds/*.rb")].each do |file|
  Rails.logger.debug { "Processing #{file.split('/').last}" }
  require file
end
