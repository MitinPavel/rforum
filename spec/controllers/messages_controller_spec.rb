require 'spec_helper'

describe MessagesController do
  describe "access control" do

    it "should deny access to 'create'" do
      post :create
      response.should redirect_to(new_user_session_path)
    end

    it "should deny access to 'destroy'" do
      delete :destroy, :id => 1
      response.should redirect_to(new_user_session_path)
    end
  end

  describe "POST 'create'" do
    login_user

    before(:each) do
      @topic = Factory(:topic)
      @attr = { :content => "lorem ipsum" }
    end

    it "should redirect to the topic page" do
      post :create, :micropost => @attr
      response.should redirect_to(topic_path(@topic))
    end

    it "should create a message" do
      lambda do
        post :create, :message => @attr
      end.should change(Message, :count).by(1)
    end
  end
end
