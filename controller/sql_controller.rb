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
        @userid = session[:userid]
        @posts = Question.all
        @answers = Answer.all
     
        erb :'pages/placeholder'
    end


    post '/question/1' do
    
        answer = Answer.new
    
        # bind the values
        answer.studentanswer = params[:studentanswer]
        answer.id = params[:id].to_i
        # save the post
        answer.save
        redirect '/question/1'
    end


    post '/student/login' do
       
        @logins = Login.all
        @tests = Test.all
        @email = params[:email]
        @password = params[:password]
        @api = InternalManagementSystemAPI.new
        @api.retrieve_token(@email, @password)
        if @api.retrieve_success == true
            session[:userid] = "#{@api.retrieve_user_id}"
            redirect "question/1"
        else
            redirect "student/login"
        end

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
       
        @score = 0;
        @countcorrect = 0;
        @checks = Checkanswer.all
        @checks.each do |check|
            @givescore = check.questionscore.to_i
            correctanswer = check.correctanswer
            givenanswer = check.studentanswer
            correctanswer_str = correctanswer.split(' ').sort
            givenanswer_str = givenanswer.split(' ').sort
            if (correctanswer_str.length === givenanswer_str.length)
                
                if(correctanswer_str === givenanswer_str)
                    @score = @givescore + @score
                    @countcorrect = @countcorrect + 1;
                end
            end
          @firstname = check.firstname
          @lastname = check.lastname
        end

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
