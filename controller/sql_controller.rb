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
        @logins = Login.all
        erb :'pages/student_login'
    end
    
    post '/student/login' do
    
        login = Login.all
    
        # bind the values
        @email = 'asd'
        if (@email = 'asd')
            redirect = "/"
        end
       
    end

    get '/question/1' do
        @posts = Question.all
        @answers = Answer.all
     
        erb :'pages/question_one_page'
    end


    post '/question/1' do
    
        answer = Answer.new
    
        # bind the values
        answer.studentanswer = params[:studentanswer]
        answer.id = params[:id].to_i
        # save the post
        answer.save
        redirect "/question/1"
    end

    put '/question/1' do
        
        id = params[:id].to_i
        answer = Answer.find id
        # bind the values
        answer.studentanswer = params[:studentanswer]
        answer.id = params[:id]    
        # save the post
        answer.save
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

end
