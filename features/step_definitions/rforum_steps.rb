Given /^a topic with the title "([^"]*)"$/ do |title|
  Topic.create!(:title => title)
end

When /^I am on the home page$/ do
  visit root_path
end

Then /^I should see "([^"]*)" listed in a full list of topics$/ do |title|
  page.should have_selector("table.topics tr td", :text => title)
end

When /^I follow "([^"]*)"$/ do |title|
  click_link(title)
end

Then /^I should see "([^"]*)" in a page body$/ do |title|
  page.should have_selector("table.topic h1", :text => title)
end

Then /^I should see "([^"]*)" in a page title$/ do |title|
  page.should have_selector("title", :text => title)
end

Then /^I should see a "([^"]*)" link$/ do |topics_link|
  page.should have_link(topics_link, :href => topics_path)
end

When /^I am on the page showing a topic with the title "([^"]*)"$/ do |title|
  topic = Topic.find_by_title(title)
  visit topic_path(topic)
end

Then /^I should see a message with the content "([^"]*)"$/ do |content|
  page.should have_content(content)
end

Then /^I should not see a message with the content "([^"]*)"$/ do |content|
  page.should_not have_content(content)
end
