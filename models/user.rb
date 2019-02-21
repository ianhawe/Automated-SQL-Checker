require 'pg'
class User

  attr_accessor :userid, :firstname, :lastname, :rolename, :cohortname, :cohortid, :id, :completed

  def self.open_connection
    conn = PG.connect( dbname: "spartaappsql" )
  end

  def get_completed
    conn = User.open_connection
    sql = "SELECT completed FROM student WHERE studentid = 2"
    results = conn.exec(sql)
    # create an array of post objects
    users = results.map do |tuple| 
       self.hydrate tuple
    end
  end

  def hydrate post_data
    user = User.new
    user.id = post_data['studentid']
    user.firstname = post_data['firstname']
    user.lastname = post_data['lasttname']
    user.completed = post_data['completed']
  end

  def save
    conn = PG.connect( dbname: "spartaappsql" )
    sql2 = "SELECT studentid FROM student WHERE studentid = #{self.userid}"
    results = conn.exec(sql2)
    sql = "INSERT INTO student(studentid, courseid, firstname , lastname) VALUES (#{self.userid}, #{self.cohortid}, '#{self.firstname}','#{self.lastname}')"
    id = results.map do |tuple|
      self.hydrate tuple
    end
    if id.empty? && self.rolename == "Trainee"
      conn.exec(sql)
    end
  end
  
  def complete_test
    conn = PG.connect( dbname: "spartaappsql" )
    sql = "UPDATE student SET completed = true WHERE studentid = #{self.userid};"
    conn.exec(sql)
  end

end
