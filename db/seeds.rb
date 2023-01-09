require './app/import_from_csv'

extend ImportFromCsv
rows = CSV.read("./data.csv", col_sep: ';')
import(rows, test: ENV['RACK_ENV'] == 'test')