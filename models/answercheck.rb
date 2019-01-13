
  class Checkanswer

    attr_accessor :studentid, :questionid, :correctanswer, :studentanswer, :studenttestid, :questionscore, :scoreachieved, :firstname, :lastname
  
    def save
  
        conn = Checkanswer.open_connection
  
      
          # Insert a new record in to the database
          sql = "DELETE FROM studentanswer WHERE questionid = #{self.id}"   
          conn.exec(sql)
     
    end
  
    def self.open_connection
  
        conn = PG.connect( dbname: "spartaappsql" )
  
    end
  
    def self.all
  
          conn = self.open_connection
  
          sql = "SELECT q.questionid, q.correctanswer, q.questionscore, sa.answer, st.scoreachieved, s.studentid, s.firstname, s.lastname
          FROM question q
          INNER JOIN studentanswer sa ON q.questionid = sa.questionid
          INNER JOIN student_test st ON sa.studenttestid = st.studenttestid
          INNER JOIN student s ON st.studentid = s.studentid;"
          results = conn.exec(sql)
  
          # create an array of post objects
          checks = results.map do |tuple| 
              self.hydrate tuple
          end
          checks
  
    end
  
    def find
      conn = self.open_connection
  
      sql = "SELECT * FROM post WHERE id = #{id} LIMIT 1"
  
      # PG always returns an array
      checks = conn.exec(sql)
  
      # bind just the first and return
      checks = self.hydrate checks[0]
  
      check
    end
    
    def self.hydrate post_data
  
      check = Checkanswer.new
      
    
      check.studentid = post_data['studentid']
      check.questionid = post_data['questionid']
      check.correctanswer = post_data['correctanswer']
      check.studentanswer = post_data['answer']
      check.studenttestid = post_data['studenttestid']
      check.questionscore = post_data['questionscore']
      check.scoreachieved = post_data['scoreachieved']
      check.firstname = post_data['firstname']
      check.lastname = post_data['lastname']
    
      check
  
    end
  
  
  end