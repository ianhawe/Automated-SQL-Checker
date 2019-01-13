class Answer

  attr_accessor :id, :question, :studentanswer

  def save

      conn = Answer.open_connection

      if(!self.id) 
        # Insert a new record in to the database
        sql = "INSERT INTO studentanswer (questionid , answer) VALUES (#{self.id},'#{self.sudentanswer}')"
      else 
        # Update an existing one
        # sql = "INSERT INTO studentanswer (questionid , answer) VALUES ('2','boi')"
        sql = "UPDATE studentanswer SET answer= #{answer.studentanswer} WHERE questionid = #{self.id}"
      end

      conn.exec(sql)

  end

  def self.open_connection

      conn = PG.connect( dbname: "spartaappsql" )

  end

  def self.all

        conn = self.open_connection

        sql = "SELECT * FROM studentanswer"
        results = conn.exec(sql)

        # create an array of post objects
        answers = results.map do |tuple| 
            self.hydrate tuple
        end

        answers

  end

  def find
    conn = self.open_connection

    sql = "SELECT * FROM post WHERE id = #{id} LIMIT 1"

    # PG always returns an array
    answers = conn.exec(sql)

    # bind just the first and return
    answer = self.hydrate answers[0]

    answer
  end
  
  def self.hydrate post_data

    answer = Answer.new

  
    answer.studentanswer = post_data['answer']
    answer.id = post_data['questionid']
  
    answer

  end


end