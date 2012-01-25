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

class Message < ActiveRecord::Base
  attr_accessible :content

  belongs_to :topic

  validates_presence_of :topic_id
end
