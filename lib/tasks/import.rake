namespace :import do
  require 'spreadsheet'       

  desc "Imports a CSV file into an ActiveRecord table"
  task :institutions => :environment do
    book = Spreadsheet.open('doc/peer_comparison.xls')
    sheet1 = book.worksheet(0) # can use an index or worksheet name
    sheet1.each do |row|
      break if row[0].nil? # if first cell empty

      begin
        i = Institution.create(unit_id: row[0], inst_name: row[1], f1_size: row[2].to_f,
          f3_access: row[4].to_f, f4_salary: row[5].to_f, f5_libarts: row[6].to_f,
          f6_ugcomp: row[7], f7_expend: row[8], f2_cost: row[3].to_f)
      rescue
        "Error loading row"
      end

      puts i.inspect
    end
  end
end