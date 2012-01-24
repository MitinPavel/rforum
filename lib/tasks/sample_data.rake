namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke

    25.times do |n|
      fake = Faker::Lorem.sentence(5)
      title = "Topic #{n+1}: #{fake}"
      Topic.create!(:title => title)
    end

    user = User.create!(:name => 'First User',
                        :email => 'user@example.com',
                        :password => 'please',
                        :password_confirmation => 'please')

  end
end
