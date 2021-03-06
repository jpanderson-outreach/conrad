require 'securerandom'

module Conrad
  # A module containing conrad's processors. They're used to modify events or add metadata before being output.
  module Processors
    # Generalized processor for inserting a UUID into the event. Allows
    # configuring the key used for insertion.
    #
    # @!attribute [r] uuid_key
    #    The key inserted into the event hash for the generated UUID.
    class AddUUID
      attr_reader :uuid_key

      # @param uuid_key [Symbol] key to use for the generated UUID
      def initialize(uuid_key = :event_uuid)
        @uuid_key = uuid_key
      end

      # @param event [Hash] the current event
      #
      # @return [Hash] the hash with the UUID inserted
      def call(event)
        event.merge(uuid_key => SecureRandom.uuid)
      end
    end
  end
end
