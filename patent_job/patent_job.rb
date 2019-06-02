class PatentJob
  def run
    Net::FTP.open('ftp.ebi.ac.uk', 'anonymous') do |ftp|
      lines = ftp.gettextfile("/pub/databases/msd/sifts/csv/pdb_chain_hmmer.csv", nil)
      Patent.connection.transaction do
        Patent.delete_all
        CSV.parse(lines, headers: true) do |row|
          Patent.create!(row.to_hash)
        end
      end
    end
  end
end
