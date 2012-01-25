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
end
