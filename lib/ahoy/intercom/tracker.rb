require 'intercom'
require 'ahoy/intercom/client'

module Ahoy
  module Intercom
    module Tracker
      include Client
      
      def track(event_name, properties = {})
        intercom.events.create(
          event_name: event_name,
          email: ahoy.user.email,
          user_id: ahoy.user.id,
          created_at: Time.now.to_i,
          metadata: properties
        )
      rescue ::Intercom::IntercomError
        # do nothing
      end
    end
  end
end
