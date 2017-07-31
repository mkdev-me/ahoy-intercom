require 'intercom'

module Ahoy
  module Intercom
    module Client

      def intercom
        @intercom ||= ::Intercom::Client.new(token: ENV['INTERCOM_ACCESS_TOKEN'])
      end
      
    end
  end
end
