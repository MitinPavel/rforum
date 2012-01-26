class MessagesController < ApplicationController
  before_filter :authenticate_user!

  def create
    @topic = Topic.first
    @message = @topic.messages.build(params[:message])
    @message.save!
    redirect_to topic_path(@topic)
  end

  def destroy
  end
end
