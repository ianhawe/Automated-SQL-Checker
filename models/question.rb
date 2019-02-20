class Question

    attr_accessor :id, :question, :studentanswer
  
    def save
        conn = Question.open_connection
        if("question-#{post.id}-text") 
          # Insert a new record in to the database
          sql = "INSERT INTO studentanswer (questionid , answer) VALUES ( post.id, '#{self.id.value}')"
         hello = self.id.value
        else 
          # Update an existing one
          sql = "UPDATE studentanswer SET answer='question-#{post.id}-text.value', questionid='#{self.id.value}' WHERE questionid = #{self.id}"
        end
        conn.exec(sql)
    end

    def self.open_connection
        conn = PG.connect( dbname: "spartaappsql" )
    end
  
    def self.all
        conn = self.open_connection
        sql = "SELECT * FROM question WHERE QuestionType = 'Beginner'"
        results = conn.exec(sql)
        # create an array of post objects
        posts = results.map do |tuple| 
            self.hydrate tuple
        end
        posts 
    end

    def self.hydrate post_data
      post = Question.new  
      post.question = post_data['question']
      post.id = post_data['questionid']
      post
    end

  end
