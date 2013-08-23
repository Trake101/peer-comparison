namespace :import do
  require 'spreadsheet'       

  desc "Imports a CSV file into an ActiveRecord table"
  task :institutions => :environment do
    book = Spreadsheet.open('doc/peer_comparison_v2.xls')
    sheet1 = book.worksheet(0) # can use an index or worksheet name
    sheet1.each(1) do |row|
      break if row[0].nil? # if first cell empty

      begin
        i = Institution.create(unit_id: row[0], inst_name: row[1], f1_size: row[2].to_f,
          f3_access: row[4].to_f, f4_salary: row[5].to_f, f5_libarts: row[6].to_f,
          f6_ugcomp: row[7], f7_expend: row[8], f2_cost: row[3].to_f, 
          state: row[12], fips: row[13], sector: row[15], control: row[17], 
          deg_grant: row[18], hbcu: row[19], tribal: row[20], locale: row[21], 
          land_grant: row[30], carnegie: row[31], year: row[9] )
      rescue Exception => e
        puts e.message
        puts "Error loading row"
      end

      puts i.inspect
    end

    # Check for identically named institutions and append state name to the end
    Institution.all.each do |i|
      matches = Institution.where(inst_name: i.inst_name)
      next if matches.to_a.length < 2
      matches.each do |m|
        m.inst_name = "#{m.inst_name} (#{m.state})"
        m.save

        puts "Renamed to #{m.inst_name}"
      end
    end
  end
end