class Answer

  attr_accessor :id, :question, :studentanswer

  def save

      conn = Answer.open_connection

    
        # Insert a new record in to the database
        sql1 = "DELETE FROM studentanswer WHERE questionid = #{self.id}"
        
        
        
        conn.exec(sql1)
        
        sql = "INSERT INTO studentanswer (questionid , answer, studenttestid) VALUES (#{self.id},'#{self.studentanswer}',1)"

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