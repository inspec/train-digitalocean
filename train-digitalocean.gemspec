lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'train-digitalocean/version'

Gem::Specification.new do |spec|
  spec.name          = 'train-digitalocean'
  spec.version       = TrainPlugins::Digitalocean::VERSION
  spec.authors       = ['Christoph Hartmann']
  spec.email         = ['chris@lollyrock.com']
  spec.summary       = "Digitalocean plugin for InSpec's Backend"
  spec.description   = 'This plugin provides the backend handling for InSpec to talk to digitalocean'
  spec.homepage      = 'https://github.com/chris-rock/train-digitaloceann'
  spec.license       = 'Apache-2.0'
  spec.files = %w{
    README.md train-digitalocean.gemspec Gemfile
  } + Dir.glob(
    'lib/**/*', File::FNM_DOTMATCH
  ).reject { |f| File.directory?(f) }
  spec.require_paths = ['lib']
  spec.add_dependency 'droplet_kit', '>= 2.4', '< 4.0'
  spec.add_dependency 'train', '~> 1.4'
end
