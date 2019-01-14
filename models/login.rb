class Login

  attr_accessor :id, :email, :password


  def self.open_connection

      conn = PG.connect( dbname: "spartaappsql" )

  end

  def self.all

        conn = self.open_connection

        sql = "SELECT * FROM student"
        results = conn.exec(sql)

        # create an array of post objects
        logins = results.map do |tuple| 
            self.hydrate tuple
        end

        logins

  end

  def self.hydrate post_data

    login = Login.new

  
    login.email = post_data['email']
    login.password = post_data['password']
    login.id = post_data['studentid']
  
    login

  end

  def find

  end

end