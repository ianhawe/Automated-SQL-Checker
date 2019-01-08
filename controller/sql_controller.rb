class SqlController < Sinatra::Base 

<<<<<<< HEAD
    set :root, File.join(File.dirname(__FILE__), '..')

    set :views, Proc.new { File.join(root, "views") }

    get '/student/question/1' do
        erb :'question_one_page'
    end
=======
    # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')

  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") }

 
  get '/question_three_page'  do
    
    erb :'question_three_page'
    
  end
>>>>>>> 83e35c14a0517eae00b704c7b9e58174995ae94f

end