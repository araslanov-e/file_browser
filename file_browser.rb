url = '/~'

get '/' do
  @url = url
  haml :home
end

get "#{url}*?" do |dir| 

  @path = dir.to_s.strip
  @path << '/' unless @path[-1, 1] == '/'

  # Вернуться назад
  @back = url + File.dirname(@path)

  # Содержимое текущей директории 
  @directories, @files = [], []
  current_path = settings.root_path + @path
  Dir.foreach(current_path) do |name|
    full_path = current_path + '/' + name
    if name != '.' && name != '..'
      if File.directory?(full_path)
        @directories << [url + @path + name, name]
      else
        @files << name
      end
    end
  end  

  haml :dir
end

