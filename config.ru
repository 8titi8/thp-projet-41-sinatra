require 'bundler'
Bundler.require
# permet d'appeler toutes les gem, remplace toutes les lignes require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'app'

run GossipProjectApp