Feature: Browse messages on topic
  So that I can browse through the messages on topic
  As a visitor
  I want to be able to read the messages on topic

Scenario: Browsing a single message on topic
  Given a topic with the title "count to 1"
  And a message with the content "one"
  When I am on the page showing a topic with the title "count to 1"
  Then I should see a message with the content "one"
