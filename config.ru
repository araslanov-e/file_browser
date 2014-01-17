require 'sinatra'
require 'haml'
require 'sass/plugin/rack'
require './file_browser.rb'

Sass::Plugin.options[:style] = :compressed
use Sass::Plugin::Rack

run Sinatra::Application
