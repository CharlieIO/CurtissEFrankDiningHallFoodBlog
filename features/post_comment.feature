Feature: Be able to comment on a blog post
  As a food enthusiast
  so that I can share my input
  I want to be able to comment on a blog post.

  Background: the site already has an existing blog post
    Given I am an authenticated user with email: "me@email.com"
    Given these BlogPosts:
      | title          | category            | location | description                      | rating       | user_id  |
      | Gross Spinach  | Dinner              | Frank    | watery, and glowing green.       | 1/5 Stars    | 1        |
    
    Scenario: comment on post
      When I follow "Sign up"
      And I fill in "Email" with "bobby@example.com"
      And I fill in "user_password" with "colgate"
      And I fill in "Password confirmation" with "colgate"
      And I press "Sign up"
      And I follow "Gross Spinach"
      And I follow "Login"
      And I fill in "Email" with "bobby@example.com"
      And I fill in "user_password" with "colgate"
      And I check "Remember me"
      And I press "Log in"
      And I follow "Gross Spinach"
      And I fill in "commentbox" with "Good"
      And I press "Add comment"
      Then I should see "Good"


