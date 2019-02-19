class Course

  attr_accessor :courseid, :coursename


  def self.open_connection

      conn = PG.connect( dbname: "spartaappsql" )

  end

  def self.all

        conn = self.open_connection

        sql = "SELECT * FROM course"
        results = conn.exec(sql)

        # create an array of post objects
        course = results.map do |tuple| 
            self.hydrate tuple
        end

        course

  end

  def self.hydrate post_data

  end

  def save
    conn = PG.connect( dbname: "spartaappsql" )
      sql = "INSERT INTO course(courseid, coursename , streamtype) VALUES (#{self.courseid}, '#{self.coursename}', 'BA')"
      results = conn.exec(sql)
  end

end