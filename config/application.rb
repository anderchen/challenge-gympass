require 'active_record'
require 'sqlite3'
require 'yaml'

# config/database.yml file and connect to the database
config_path = File.join(File.dirname(__FILE__), "database.yml")
ActiveRecord::Base.configurations = YAML.load_file(config_path)
ActiveRecord::Base.establish_connection(:development)

# Uncomment the code below to set a logger so that you can view the SQL actually performed by ActiveRecord
# logger = Logger.new(STDOUT)
# logger.formatter = proc do |_severity, _datetime, _progname, msg|
#   "#{msg}\n"
# end
# ActiveRecord::Base.logger = logger

# Load models
Dir["#{__dir__}/../app/models/*.rb"].each { |file| require file }