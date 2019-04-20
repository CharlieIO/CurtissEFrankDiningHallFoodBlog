Feature: Be able to update an existing blog post
  As a food enthusiast
  so that I can change what I thought about my meal
  I want to be able to update the information I put in my blog post.

  Background: the site already has an existing blog post
    Given I am an authenticated user with email: "me@email.com"
    Given these BlogPosts:
      | title          | category            | location | description                      | rating       | user_id  |
      | Gross Spinach  | Dinner              | Frank    | watery, and glowing green.       | 1/5 Stars    | 1        |


  Scenario: Be able to update an existing blog post
    Given I am on the blog posts page
    When I follow "Gross Spinach"
    Then I should see "Dinner"
    And I should see "Frank"
    And I should see "watery, and glowing green."
    And I should see "1/5 Stars"
    When I follow "Edit post details"
    And I follow "Sign up"
    And I fill in "Email" with "test1@example.com"
    And I fill in "user_password" with "colgate"
    And I fill in "Password confirmation" with "colgate"
    And I press "Sign up"
    And I select "Lunch" from "Meal Time"
    And I select "Coop" from "Location"
    And I press "Update Blog Post"
    Then I should see "You don't have permission to do that."
