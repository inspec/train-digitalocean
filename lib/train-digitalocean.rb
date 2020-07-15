libdir = File.dirname(__FILE__)
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

require "train-digitalocean/version"
require "train-digitalocean/transport"
require "train-digitalocean/platform"
require "train-digitalocean/connection"
