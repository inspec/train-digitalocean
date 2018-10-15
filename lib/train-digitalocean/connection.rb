require 'droplet_kit'
require 'train-digitalocean/platform'

module TrainPlugins
  module Digitalocean
    class Connection < Train::Plugins::Transport::BaseConnection
      include TrainPlugins::Digitalocean::Platform

      def initialize(options)
        msg = 'You need to set the Digitalocean access token via \'export DIGITALOCEAN_TOKEN=.\''
        if options.nil? || options[:access_token].nil?
          raise Train::TransportError, msg
        end

        super(options)

        # check account to verify authentication
        begin
          @uuid = droplet_client.account.info.uuid
        rescue DropletKit::Error
          raise Train::TransportError, msg
        end
      end

      def local?
        false
      end

      def uri
        'digitalocean://'
      end

      def droplet_client
        klass = ::DropletKit::Client
        return klass.new(access_token: @options[:access_token]) unless cache_enabled?(:api_call)

        @cache[:api_call][klass.to_s.to_sym] ||= klass.new(access_token: @options[:access_token])
      end

      def unique_identifier
        @uuid
      end
    end
  end
end
