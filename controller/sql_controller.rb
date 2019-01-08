class SqlController < Sinatra::Base 

    set :root, File.join(File.dirname(__FILE__), '..')
    set :views, Proc.new {File.join(root, "views") }

    get '/student/review' do
        erb :'student-review'
    end

    get '/admin/student-review' do
        erb :'admin-student-review'
    end

end