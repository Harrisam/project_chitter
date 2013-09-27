env = ENV["RACK_ENV"] || "development"

DataMapper::Logger.new(STDOUT, :debug)
DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")
require './lib/maker'
DataMapper.finalize
DataMapper.auto_upgrade!