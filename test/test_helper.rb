# Configure Rails Environment
ENV['RAILS_ENV'] = 'test'

require File.expand_path('../dummy/config/environment.rb', __FILE__)

require 'shoulda'
# for RubyMine
require 'minitest/reporters'
MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new

class ActiveSupport::TestCase
  def load_test_sdn_file
    sdn = File.new(File.dirname(__FILE__) + '/files/test_sdn_data_load.pip')
    address = File.new(File.dirname(__FILE__) + '/files/test_address_data_load.pip')
    alt = File.new(File.dirname(__FILE__) + '/files/test_alt_data_load.pip')
    OfacSdnIndividualLoader.active_record_file_load(sdn, address, alt)
    sdn.close
    address.close
    alt.close
  end
end

