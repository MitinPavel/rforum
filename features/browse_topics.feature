Feature: Browse topics
  So that I can browse through the topics
  As a visitor
  I want to be able to see choose a topic from a full list of topics and read it

Scenario: Browsing a list of topics
  Given a topic with the title "the answer to the question of life"
  And a topic with the title "why 42 is the new pink"
  When I am on the home page
  Then I should see "the answer to the question of life" listed in a full list of topics
  And I should see "why 42 is the new pink" listed in a full list of topics

Scenario: Reading a topic
  Given a topic with the title "the answer to the question of life"
  When I am on the home page
  And I follow "the answer to the question of life"
  Then I should see "the answer to the question of life" in a page body
  And I should see "the answer to the question of life" in a page title
  And I should see a "Home" link
