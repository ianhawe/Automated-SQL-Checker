class SqlController < Sinatra::Base 

 # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')

  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") }

  get '/' do
      erb  :'pages/index'
  end
  
  get '/admin/login' do
      erb  :'pages/admin_login'
  end

  get 'admin/search' do
      erb  :'pages/search'
  end
  
end