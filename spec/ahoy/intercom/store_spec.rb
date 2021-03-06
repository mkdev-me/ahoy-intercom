require "spec_helper"

RSpec.describe Ahoy::Intercom::Store do

  before { ahoy.authenticate(user) }

  after { intercom.users.delete(intercom_user) }

  let!(:ahoy) { Ahoy::Tracker.new }
  let(:user) { OpenStruct.new(email: 'test_user@example.com', name: 'Test User') }
  let(:intercom) { ::Intercom::Client.new(token: ENV['INTERCOM_ACCESS_TOKEN']) }
  let!(:intercom_user) { intercom.users.create(user.to_h) }

  it "stored into intercom" do
    ahoy.track('intercom_event', {prop1: 'hello', prop2: 'world'})
    subject = intercom.events.find_all(type: 'user', email: user.email).first
    expect(subject.event_name).to eq("intercom_event")
    expect(subject.metadata).to eq({'prop1' => 'hello', 'prop2'=> 'world'})
  end
end
