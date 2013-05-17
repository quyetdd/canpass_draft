class ImportCsv
  @queue = :csv_queue
  
  def self.perform(file)
    require "csv"
    CSV.foreach(file, headers: true) do |row|
      Client.create(
        client_name: row[0],
        romaji_name: row[1],
        tel: row[2],
        department_name: row[3],
        contract_flg: row[4],
        contract_type: row[5],
        del_flg: row[6]
      )
    end
  end
end
