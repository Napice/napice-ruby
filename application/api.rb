# Load path and gems/bundler
$LOAD_PATH << File.expand_path(File.dirname(__FILE__))

require 'tilt/erb'
require 'bundler'
require 'logger'
Bundler.require

require 'dotenv'
Dotenv.load

file_path = File.dirname(__FILE__)

%w{config/initializers api/graph/types api/models middlewares}.each do |path|
  Dir["#{file_path}/#{path}/**/*.rb"].each { |file| require file }
end

require './application/api/roda_graphql'
