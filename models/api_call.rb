require 'httparty'
require 'json'

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

end

