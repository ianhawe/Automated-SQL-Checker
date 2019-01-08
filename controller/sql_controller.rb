class SqlController < Sinatra::Base 

    # sets root as the parent-directory of the current file
    set :root, File.join(File.dirname(__FILE__), '..')
    # sets the view directory correctly
    set :views, Proc.new { File.join(root, "views") }

    get '/question_two_page' do
        erb :'/question_two_page'
    end
  
end