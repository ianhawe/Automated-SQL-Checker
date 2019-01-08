class SqlController < Sinatra::Base 

    set :root, File.join(File.dirname(__FILE__), '..')

    set :views, Proc.new { File.join(root, "views") }


    get '/' do
        erb :'pages/index'
    end

    get '/student/login' do
        erb :'pages/student_login'
    end
    
    get '/admin/login' do
        erb :'pages/admin_login'
    end

    get '/question/1' do
        erb :'pages/question_one_page'
    end

    get '/question/2' do
        erb :'pages/question_two_page'
    end

    get '/question/3' do
        erb :'pages/question_three_page'
    end

    get '/review' do
        erb :'pages/review_questions'
    end

    get '/student/score' do
        erb :'pages/score_page'
    end

    get '/search' do
        erb :'pages/admin_search'
    end

    get '/admin/score' do
        erb :'pages/score_page'
    end

    get '/admin/review_student' do
        erb :'pages/admin_student_review'
    end
end
