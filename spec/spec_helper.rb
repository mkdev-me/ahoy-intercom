require "bundler/setup"
require "ahoy/intercom"
require "active_record"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:suite) do
    Time.zone = 'UTC'

    ActiveRecord::Base.establish_connection(
      adapter: 'sqlite3',
      database: ':memory:'
    )

    class ::Ahoy::Event < ActiveRecord::Base
      belongs_to :user
      serialize :properties, JSON
    end

    class User < ActiveRecord::Base
      has_many :events
    end

    class ::Visit < ActiveRecord::Base
    end

    class Ahoy::Store < Ahoy::Intercom::Store
    end

    ActiveRecord::Schema.define do
      create_table :events do |t|
        t.string :visit_id
        t.integer :user_id
        t.string :name
        t.text :properties
        t.datetime :time
        t.timestamps
      end
    end

    ActiveRecord::Schema.define do
      create_table :visits
    end

    ActiveRecord::Schema.define do
      create_table :users do |t|
        t.string :email
        t.string :name
      end
    end
  end
end
