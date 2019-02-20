require 'pg'
class Test

  attr_accessor :questionid, :studentid, :studentanswer, :studenttestid

  def save_answers
    conn = Test.open_connection
    # Insert a new record in to the database
    sql1 = "DELETE FROM studentanswer WHERE questionid = #{self.questionid} AND studenttestid = #{self.studenttestid} "
    conn.exec(sql1)
    sql = "INSERT INTO studentanswer (questionid , answer, studenttestid) VALUES (#{self.questionid},'#{self.studentanswer}',#{self.studenttestid})"
    conn.exec(sql)
  end

  def self.open_connection
    conn = PG.connect( dbname: "spartaappsql" )
  end

  def add_test
    conn = Test.open_connection
    sql = "INSERT INTO student_test (testid , scoreachieved, studentid) VALUES (1,'0', #{self.studentid})"
    sql2 = "SELECT studentid FROM student_test WHERE studentid = #{self.studentid}"
    results = conn.exec(sql2)
    id = results.map do |tuple|
      self.hydrate tuple
    end
    if id.empty?
      conn.exec(sql)
    end
  end

  def find_test
    conn = Test.open_connection
    sql = "SELECT * FROM student_test WHERE studentid = #{self.studentid}"
    result = conn.exec(sql)
    result.each do |tuple|
       self.hydrate tuple
    end
  end

  def count
    conn = Test.open_connection
    sql = "SELECT COUNT (studenttestid) FROM student_test AS count"
    result = conn.exec(sql)
    result
  end

  def self.all

    conn = self.open_connection

    sql = "SELECT * FROM student_test"
    results = conn.exec(sql)

    # create an array of post objects
    tests = results.map do |tuple| 
        self.hydrate tuple
    end

    tests

  end

  def find
    conn = self.open_connection

    sql = "SELECT * FROM student_test WHERE id = #{self.id} LIMIT 1"

    # PG always returns an array
    tests = conn.exec(sql)

    # bind just the first and return
    test = self.hydrate answers[0]

    test
  end
  
  def hydrate post_data

    test = Test.new
    test.studenttestid = post_data['studenttestid']
    test.studentid = post_data['studentid']
  
    test

  end

end
