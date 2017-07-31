require "spec_helper"

RSpec.describe Ahoy::Intercom do

  before do
    ahoy.authenticate(user)
  end

  after { intercom.users.delete(intercom_user) }

  let!(:ahoy) { Ahoy::Tracker.new }
  let(:user_info) { {email: 'test_user@example.com', name: 'Test User'} }
  let!(:user) { User.create(user_info) }
  let!(:intercom) { ::Intercom::Client.new(token: ENV['INTERCOM_ACCESS_TOKEN']) }
  let!(:intercom_user) { intercom.users.create(user_info) }

  it "stored into database" do
    ahoy.track('some_event', {prop1: 'hello', prop2: 'world'})
    expect(Ahoy::Event.count).to eq(1)
    expect(Ahoy::Event.first).to have_attributes(name: 'some_event')
  end

  it "stored into intercom" do
    ahoy.track('another_event', {prop1: 'bye', prop2: 'world'})
    subject = intercom.events.find_all(type: 'user', email: user.email).first
    expect(subject.event_name).to eq("another_event")
    expect(subject.metadata).to eq({'prop1' => 'bye', 'prop2'=> 'world'})
    expect(Ahoy::Event.order(:created_at).last).to have_attributes(name: 'another_event')
  end
end
