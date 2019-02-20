class SqlController < Sinatra::Base 
	helpers Sinatra::Cookies

	set :root, File.join(File.dirname(__FILE__), '..')

	set :views, Proc.new { File.join(root, "views") }

	enable :sessions
	use Rack::Session::Cookie, :key => 'my_app_key', :path => '/', :expire_after => 2000000, :secret => 'secret_stuff'

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
		if session[:userid] == nil
			erb :'pages/student_login'
		else
			redirect "/question/1"
		end
		erb :'pages/student_login'
	end

	get '/question/1' do
		if session[:userid] == nil
			redirect "student/login"
		end
		@userid = session[:userid]
		@posts = Question.all
		@answers = Answer.new
		@answers.studenttestid = session[:testid]
		@studentanswers = @answers.all
		erb :'pages/question_one_page'
	end

	post '/question/1' do
		answer = Test.new
		# bind the values
		answer.studentanswer = params[:studentanswer]
		answer.questionid = params[:id].to_i
		answer.studenttestid = session[:testid]
		# save the post
		answer.save_answers
		redirect '/question/1'
	end

	post '/student/login' do 
		@user = User.new
		@course = Course.new
		@test = Test.new
		@email = params[:email]
		@password = params[:password]
		@api = InternalManagementSystemAPI.new
		@api.retrieve_token(@email, @password)
		@course.courseid = @api.retrieve_cohort_id
		@course.coursename = @api.retrieve_cohort_name
		@user.userid = @api.retrieve_user_id
		@user.cohortid = @api.retrieve_cohort_id
		@user.rolename = @api.retrieve_role_name
		@user.firstname = @api.retrieve_first_name
		@user.lastname = @api.retrieve_last_name
		@test.studentid = @api.retrieve_user_id

	if @api.retrieve_success == true && @api.retrieve_role_name == "Trainee"
			session[:userid] = "#{@api.retrieve_user_id}"
			@course.save
			@user.save
			@test.add_test
			session[:testid] = @test.find_test[0]['studenttestid'].to_i
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
		if session[:userid] == nil
			redirect "student/login"
		end
		erb :'pages/question_two_page'
	end

	get '/question/3' do
		erb :'pages/question_three_page'
	end

	get '/student/review' do
		if session[:userid] == nil
			redirect "student/login"
		end
		erb :'pages/review_questions'
	end

	get '/student/score' do
		if session[:userid] == nil
			redirect "student/login"
		end
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