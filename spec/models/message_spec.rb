# == Schema Information
#
# Table name: messages
#
#  id         :integer         not null, primary key
#  content    :text
#  user_id    :integer
#  topic_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Message do
  before(:each) do
    @topic = Factory(:topic)
    @attr = {
      :content  => "Example Content",
    }
  end

  it "should create a new instance given valid attributes" do
    @topic.messages.create!(@attr)
  end

  it { should_not allow_mass_assignment_of(:user_id) }

  it { should_not allow_mass_assignment_of(:topic_id) }

  it { should belong_to(:topic) }

  it { should validate_presence_of(:topic_id) }

#  it "should have the right associated topic" do
#    message = @topic.messages.create(@attr)
#    message.topic_id.should == @topic.id
#    message.topic.should == @topic
#  end
end
