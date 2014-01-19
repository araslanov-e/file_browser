require 'sinatra'
require 'haml'
require 'sass/plugin/rack'
require './file_browser.rb'

# Начальная директория
set :root_path, '/home/araslanov'

# Настройки Sass
Sass::Plugin.options[:style] = :compressed
use Sass::Plugin::Rack

run Sinatra::Application
