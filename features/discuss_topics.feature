Feature: Discuss topics
  In order to participate in topic discussion
  As a signed-in user
  I want to create and delete messages in the topic

Scenario: Adding a message on topic
  Given the following messages exist:
    | Content   | Topic             |
    | cuke      | Title: BDD        |
    | message 1 | Title: count to 2 |
  And I am a signed-in user
  And I am on the page showing a topic with the title "BDD"
  And I follow "Post reply"
  And I fill in "Content" with "true"
  When I press "Submit"
  Then a message containing "true" should be in a topic titled "BDD"
  And I should be on the page showing a topic with the title "BDD"
  Given I am on the page showing a topic with the title "count to 2"
  And I follow "Post reply"
  And I fill in "Content" with "message 2"
  When I press "Submit"
  Then a message containing "message 2" should be in a topic titled "count to 2"
  Then I should be on the page showing a topic with the title "count to 2"

Scenario: Failing to add an invalid message
  Given the following topic exists:
   | Title      |
   | validate   |
  And I am a signed-in user
  And I am on the page showing a topic with the title "validate"
  And I follow "Post reply"
  And I fill in "Content" with "no"
  When I press "Submit"
  Then I should be on the new message page in a topic titled "validate"
  And I shoud see an error explanation "Content is too short"
  And I should see a value "no" in a field "Content"
