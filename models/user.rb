require 'pg'
class User

  attr_accessor :userid, :firstname, :lastname, :rolename, :cohortname, :cohortid, :id


  def self.open_connection

      conn = PG.connect( dbname: "spartaappsql" )

  end

  def self.all

    conn = self.open_connection

    sql = "SELECT * FROM student"
    results = conn.exec(sql)

    # create an array of post objects
    users = results.map do |tuple| 
        self.hydrate tuple
    end

    users

  end

  def hydrate post_data

    user = User.new
    user.id = post_data['studentid']

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

end
