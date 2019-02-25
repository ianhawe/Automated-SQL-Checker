
  require 'pg'
  class Checkanswer

    attr_accessor :studentid, :questionid, :correctanswer, :studentanswer, :studenttestid, :questionscore, :scoreachieved, :firstname, :lastname, :studenttestid, :countquestion, :maxscore
  
    def save
      conn = Checkanswer.open_connection
      # Insert a new record in to the database
      sql = "DELETE FROM studentanswer WHERE questionid = #{self.id}"   
      conn.exec(sql)
    end
  
    def self.open_connection
      conn = PG.connect( dbname: "spartaappsql" )
    end
  
    def all
      conn = Checkanswer.open_connection
      sql = "SELECT q.questionid, q.correctanswer, q.questionscore, sa.answer, st.scoreachieved, s.studentid, s.firstname, s.lastname
      FROM question q
      INNER JOIN studentanswer sa ON q.questionid = sa.questionid
      INNER JOIN student_test st ON sa.studenttestid = st.studenttestid
      INNER JOIN student s ON st.studentid = s.studentid
      WHERE st.studenttestid = #{self.studenttestid};"
      results = conn.exec(sql)
      # create an array of post objects
      checks = results.map do |tuple| 
          self.hydrate tuple
      end
      checks
    end

     def get_all_questions 
      conn = Checkanswer.open_connection
      type = 'Beginner'
      sql = 'SELECT count(question) AS "Count", sum(questionscore) AS "SUM" from question WHERE questiontype = 1;'
      results = conn.exec(sql)
      check = results.map do |tuple|
        self.hydrate tuple
      end
      check
    end
  
    def find
      conn = Checkanswer.open_connection
      sql = "SELECT * FROM post WHERE id = #{id} LIMIT 1"
      # PG always returns an array
      checks = conn.exec(sql)
      # bind just the first and return
      checks = self.hydrate checks[0]
      check
    end
    
    def hydrate post_data
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
      check.maxscore = post_data['SUM']
      check.countquestion = post_data['Count']
      check  
    end
    
  end
