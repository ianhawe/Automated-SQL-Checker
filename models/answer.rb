class Answer

  attr_accessor :id, :question, :studentanswer

  def save

      conn = Answer.open_connection

      if(!self.id) 
        # Insert a new record in to the database
        sql = "INSERT INTO studentanswer (questionid , answer) VALUES ( post.id, 'question-#{self.id}-text.value')"
      else 
        # Update an existing one
        sql = "UPDATE studentanswer SET answer='question-#{post.id}-text.value', questionid='#{self.id}' WHERE questionid = #{self.id}"
      end

      conn.exec(sql)

  end

  def self.open_connection

      conn = PG.connect( dbname: "spartaappsql" )

  end

  def self.all

        conn = self.open_connection

        sql = "SELECT * FROM question"
        results = conn.exec(sql)

        # create an array of post objects
        posts = results.map do |tuple| 
            self.hydrate tuple
        end

        posts

  end

  def self.hydrate post_data

    post = Answer.new

  
    post.question = post_data['question']
    post.id = post_data['questionid']
  
    post

  end

end