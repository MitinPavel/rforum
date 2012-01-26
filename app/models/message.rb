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
  validates :content, :length => { :minimum => 3, :maximum => 1000 }

  default_scope :order => 'messages.created_at ASC'
end
