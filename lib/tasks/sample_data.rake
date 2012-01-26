namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke

    25.times do |n|
      fake = Faker::Lorem.sentence(4)
      title = "Topic #{n+1}: #{fake}"
      Topic.create!(:title => title)
    end

    Topic.all(:limit => 6).each do |topic|
      (1 + rand(9)).times do
        msg = topic.messages.create!(
          :content => Faker::Lorem.paragraph(1 + rand(3)))
        msg.update_attribute :created_at, rand(4320).minutes.ago
      end
    end

    user = User.create!(:name => 'First User',
                        :email => 'user@example.com',
                        :password => 'please',
                        :password_confirmation => 'please')

  end
end
