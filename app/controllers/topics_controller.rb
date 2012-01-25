class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
    @messages = @topic.messages
    @title = @topic.title
  end
end
