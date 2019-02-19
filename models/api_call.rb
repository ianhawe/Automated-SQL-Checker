require 'httparty'
require 'json'
require 'jwt'

class InternalManagementSystemAPI
  include HTTParty
  base_uri "http://localhost:9292"

  def retrieve_token(email, password)
    @token = JSON.parse(self.class.post("/api", body: {"email": email, "password": password}.to_json).body)
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

  def retrieve_first_name
    decode[0]['first_name']
  end

  def retrieve_last_name
    decode[0]['last_name']
  end

  def retrieve_role_name
    decode[0]['role_name']
  end

  def retrieve_cohort_name
    decode[0]['cohort_name']
  end

  def retrieve_specialisation_name
    decode[0]['specialisation_name']
  end

end
