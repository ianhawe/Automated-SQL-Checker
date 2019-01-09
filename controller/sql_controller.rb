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
        erb :'pages/question_one_page'
    end

    get '/question/2' do
        erb :'pages/question_two_page'
    end

    get '/question/3' do
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
    
    get '/admin/score' do
        erb :'pages/score_page'
    end

    get '/admin/create/course' do
        erb :'pages/admin_create_course'
    end

    get '/admin/create/student' do
        erb :'pages/admin_create_student'
    end

end
