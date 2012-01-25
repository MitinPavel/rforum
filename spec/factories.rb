require 'factory_girl'

Factory.define :user do |user|
  user.name     'Test User'
  user.email    'user@test.com'
  user.password 'please'
end

Factory.define :topic do |topic|
  topic.title 'Making BDD fun!'
end

Factory.define :message do |msg|
  msg.sequence(:content) {|i| "message #{i}" }
  msg.association :topic, :factory => :topic
end
