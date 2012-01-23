namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke

    25.times do |n|
      fake = Faker::Lorem.sentence(5)
      title = "Topic #{n+1}: #{fake}"
      Topic.create!(:title => title)
    end
  end
end
