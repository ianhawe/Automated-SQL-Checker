class SqlController < Sinatra::Base 

      # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')

    # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") }

    get '/' do
        erb  :'posts/index'
    end
    
    get '/student/login' do
        erb  :'posts/student_login'
    end

    get '/question/1' do
        erb  :'posts/question_one_page'
    end

end