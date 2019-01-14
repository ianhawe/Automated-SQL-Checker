class Test

  attr_accessor :id, :studentid, :count

  def save

      conn = Test.open_connection

    
        # Insert a new record in to the database
        sql1 = "DELETE FROM studentanswer WHERE questionid = #{self.id}"
        
        
        
        conn.exec(sql1)
        
        sql = "INSERT INTO studentanswer (questionid , answer, studenttestid) VALUES (#{self.id},'#{self.studentanswer}',1)"

        conn.exec(sql)

  end

  def self.open_connection

      conn = PG.connect( dbname: "spartaappsql" )

  end

  def add
    conn = Test.open_connection
    sql = "INSERT INTO student_test (testid , scoreachieved, studentid) VALUES (1,'0',#{self.id})"
    result = con.exec(sql)
    result

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

    sql = "SELECT * FROM student_test WHERE id = #{id} LIMIT 1"

    # PG always returns an array
    tests = conn.exec(sql)

    # bind just the first and return
    test = self.hydrate answers[0]

    test
  end
  
  def self.hydrate post_data

    test = Test.new

  
    test.id = post_data['studenttestid']
    test.studentid = post_data['studentid']
    test.count = post_data['count']
  
    test

  end


end