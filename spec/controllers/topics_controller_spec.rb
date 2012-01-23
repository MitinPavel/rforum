require 'spec_helper'

describe TopicsController do
  describe "GET 'index'" do
    it "should be successful" do
      get :index
      response.should be_success
    end
  end

  describe "GET 'show'" do
    before(:each) do
      @topic = Factory(:topic)
    end

    it "should be successful" do
      get :show, :id => @topic
      response.should be_success
    end
  end
end
