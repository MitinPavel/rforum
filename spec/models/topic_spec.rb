# == Schema Information
#
# Table name: topics
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Topic do
  before(:each) do
    @attr = {
      :title => "Example Title"
    }
  end

  it "should create a new instance given valid attributes" do
    Topic.create!(@attr)
  end

  it { should have_many(:messages) }

  it "should have the right messages in the right order" do
    topic = Topic.create(@attr)
    msg1 = Factory(:message, :topic => topic, :created_at => 1.hour.ago)
    msg2 = Factory(:message, :topic => topic, :created_at => 1.day.ago)

    topic.messages.should == [msg2, msg1]
  end
end
