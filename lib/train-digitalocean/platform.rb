module TrainPlugins::Digitalocean
  module Platform
    def platform
      Train::Platforms.name('digitalocean').in_family('cloud')
      force_platform!('digitalocean', release: TrainPlugins::Digitalocean::VERSION)
    end
  end
end
