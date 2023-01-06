require 'sidekiq'
require 'json'
require './app/import_from_csv'

class ImportJob
  include Sidekiq::Job
  include ImportFromCsv

  def perform(rows)
    import(JSON.parse(rows))
  end
end
