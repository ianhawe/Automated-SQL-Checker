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
    get '/student_login' do
        erb :'pages/student_login'
    end

    get '/question_1' do
        @title = "Question 1"
        @next_review = "Next"
        @link = '/question_2'
        @backlink = '/student_login'
        @back = "Back"
        erb :'pages/question_one_page'
    end

    get '/question_2' do
        @title = "Question 2"
        @next_review = "Next"
        @link = '/question_3'
        @backlink = '/question_1'
        @back = "Back"
        erb :'pages/question_two_page'
    end

    get '/question_3' do
        @title = "Question 3"
        @next_review = "Review Questions"
        @link = '/student_review'
        @backlink = '/question_2'
        @back = "Back"
        erb :'pages/question_three_page'
    end

    get '/student_review' do
        erb :'pages/review_questions'
    end

    get '/student_score' do
        erb :'pages/score_page'
    end

    #admin route
    get '/admin_login' do
        erb :'pages/admin_login'
    end
    
    get '/admin_search' do
        erb :'pages/admin_search'
    end
    
    get '/admin/create_course' do
        erb :'pages/admin_create_course'
    end

    get '/admin/create_student' do
        erb :'pages/admin_create_student'
    end

    get '/admin_score' do
        @admin_back_button = "admin_path"
        @admin_info_button = "admin_path"
        erb :'pages/score_page'
    end

    get '/admin_student_review' do
        erb :'pages/admin_student_review'
    end
    
end
