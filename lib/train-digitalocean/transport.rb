require "train-digitalocean/connection"

module TrainPlugins
  module Digitalocean
    class Transport < Train.plugin(1)
      name "digitalocean"
      option :access_token, default: ENV["DIGITALOCEAN_TOKEN"]
      def connection(_instance_opts = nil)
        @connection ||= TrainPlugins::Digitalocean::Connection.new(@options)
      end
    end
  end
end
