require "bundler/setup"
require "ahoy/intercom"

RSpec.configure do |config|

  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:suite) do

    Time.zone = 'UTC'

    class Ahoy::Store < Ahoy::Intercom::Store
    end
  end
end
