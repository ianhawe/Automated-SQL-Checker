require 'pg'
class Course

  attr_accessor :courseid, :coursename, :id


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

  def hydrate (post_data)
    course = Course.new
    course.id = post_data['courseid']
  end

  def save
    conn = PG.connect( dbname: "spartaappsql" )
    sql = "INSERT INTO course(courseid, coursename , streamtype) VALUES (#{self.courseid}, '#{self.coursename}', 'BA')"
    sql2 = "SELECT courseid FROM course WHERE courseid = #{self.courseid}"
    results2 = conn.exec(sql2)
    id = results2.map do |tuple|
      self.hydrate tuple
    end
    if id.empty?
      conn.exec(sql)
    end
  end
end
