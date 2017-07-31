require 'intercom'

module Ahoy
  module Intercom
    module Client

      def intercom
        @intercom ||= ::Intercom::Client.new(credentials)
      end

      def credentials
        {
          app_id: ENV['INTERCOM_APP_ID'],
          api_key: ENV['INTERCOM_APP_SECRET'],
          token: ENV['INTERCOM_ACCESS_TOKEN']
        }
      end

    end
  end
end
