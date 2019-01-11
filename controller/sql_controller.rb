class SqlController < Sinatra::Base 
    helpers Sinatra::Cookies

    set :root, File.join(File.dirname(__FILE__), '..')

    set :views, Proc.new { File.join(root, "views") }

    enable :sessions
    use Rack::Session::Cookie, :key => 'my_app_key',
                               :path => '/',
                               :expire_after => 2000000, # In seconds
                               :secret => 'secret_stuff'

    #index
    get '/' do
        erb :'pages/index'
    end

    #info
    get '/info' do
        erb :'pages/info_page'
    end

    #student route
    get '/student/login' do
        erb :'pages/student_login'
    end

    get '/question/1' do
        @title = "Question 1"
        @next_review = "Next"
        @link = '/question/2'
        @backlink = '/student/login'
        @back = "Back"
        erb :'pages/question_one_page'
    end

    get '/question/2' do
        @title = "Question 2"
        @next_review = "Next"
        @link = '/question/3'
        @backlink = '/question/1'
        @back = "Back"
        erb :'pages/question_two_page'
    end

    get '/question/3' do
        @title = "Question 3"
        @next_review = "Review Questions"
        @link = '/student/review'
        @backlink = '/question/2'
        @back = "Back"
        erb :'pages/question_three_page'
    end

    get '/student/review' do
        erb :'pages/review_questions'
    end

    get '/student/score' do
        erb :'pages/score_page'
    end

    #admin route
    get '/admin/login' do
        erb :'pages/admin_login'
    end
    
    get '/admin/search' do
        erb :'pages/admin_search'
    end
    
    get '/admin/create/course' do
        erb :'pages/admin_create_course'
    end

    get '/admin/create/student' do
        erb :'pages/admin_create_student'
    end

    get '/admin/score' do
        @admin_back_button = "admin_path"
        @admin_info_button = "admin_path"
        erb :'pages/score_page'
    end

    get '/admin/student/review' do
        erb :'pages/admin_student_review'
    end
    
end
