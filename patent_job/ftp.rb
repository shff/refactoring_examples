require 'tempfile'
require 'net/ftp'
require 'csv'

require_relative 'patent_job'

class Patent
  class Connection
    def self.transaction
      yield
    end
  end

  def self.connection
    Connection
  end

  def self.delete_all
    puts "Deleted everything"
  end

  def self.create!(*args)
    puts "Creating: #{args.inspect}"
  end
end

PatentJob.new.run
