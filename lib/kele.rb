require 'httparty'
require 'JSON'
require_relative './roadmap'

class Kele
  include HTTParty
  include Roadmap   

    def initialize (email, password)
      response = self.class.post("https://www.bloc.io/api/v1/sessions", body: {"email": email, "password": password})
      raise "Invalid Email or Password" if response.code == 404 || response.code == 401
      @auth_token = response["auth_token"]
    end

    def get_me
      response = self.class.get("https://www.bloc.io/api/v1/users/me", headers: { "authorization" => @auth_token })
      @me = JSON.parse(response.body)
    end

    def get_mentor_availability(mentor_id)
      response = self.class.get("https://www.bloc.io/api/v1/mentors/#{mentor_id}/student_availability", headers: { "authorization" => @auth_token })  
      @mentor_availability = JSON.parse(response.body)
    end

    def get_messages(page_num=nil)
      if page_num == nil
        response = self.class.get("https://www.bloc.io/api/v1/message_threads"), headers: { "authorization" => @auth_token })
      else
        response = self.class.get(api_url("https://www.bloc.io/api/v1/message_threads?page=#{page_num}"), headers: { "authorization" => @auth_token })
      end
      @messages = JSON.parse(response.body)
    end

    def create_message(sender, recipient_id, subject, stripped_text)
      response = self.class.post("https://www.bloc.io/api/v1/messages"), 
        body: {
          "sender": sender,
          "recipient_id": recipient_id,
          "subject": subject,
          "stripped_text": stripped_text
      },
        headers: {"authorization" => @auth_token})
    end
end