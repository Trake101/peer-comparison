namespace :import do
  require 'spreadsheet'       

  desc "Imports a CSV file into an ActiveRecord table"
  task :institutions => :environment do
    book = Spreadsheet.open('doc/peer_comparison_v3.xls')
    sheet1 = book.worksheet(0) # can use an index or worksheet name
    sheet1.each(1) do |row|
      break if row[0].nil? # if first cell empty

      begin
        i = Institution.create(unit_id: row[1], inst_name: row[2], f1_size: row[3].to_f,
          f3_access: row[5].to_f, f4_salary: row[6].to_f, f5_libarts: row[7].to_f,
          f6_ugcomp: row[8], f7_expend: row[9], f2_cost: row[4].to_f, 
          state: row[10], fips: row[11], sector: row[12], control: row[13], 
          deg_grant: row[14], hbcu: row[15], tribal: row[16], locale: row[17], 
          land_grant: row[18], carnegie: row[19], year: row[20],
          address: row[24], city: row[25], zip: row[27], website: row[28],
          county_code: row[29], county: row[30], longitude: row[32].to_f, latitude: row[33].to_f )

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