require 'httparty'
require 'json'
require 'jwt'

class InternalManagementSystemAPI
  include HTTParty
  base_uri "http://localhost:9292"

  def retrieve_token(email, password)
    @token = (self.class.post("/api", body: {"email": email, "password": password}.to_json).body)
    if @token.empty? == false
      @token = JSON.parse(@token)
    end
  end

  def retrieve_success
    @token['success']
  end

  def decode
    JWT.decode @token['token'], nil, false
  end

  def retrieve_user_id
    decode[0]['user_id']
  end

end

# test = InternalManagementSystemAPI.new
# p test.retrieve_token("admin@spartaglobal.com", "Password1")