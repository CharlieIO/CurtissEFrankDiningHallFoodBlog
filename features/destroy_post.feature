Feature: Delete a Blog Post
  As a user
  So that I can delete a post I don't want to share anymore
  I want to be able to delete my blog post and all of its details.


  Background: the site already has an existing blog post
    Given I am on the blog posts page
    Given I am an authenticated user with email: "me@email.com"
    Given these BlogPosts:
      | title          | category            | location | description                      | rating       | user_id |
      | Gross Spinach  | Dinner              | Frank    | watery, and glowing green.       | 1/5 Stars    | 1       |


    Scenario: Delete a blog post
      Given I am on the blog posts page
      When I follow "Gross Spinach"
      And I follow "Delete post"
      And I follow "Sign up"
      And I fill in "Email" with "me@email.com"
      And I fill in "user_password" with "colgate"
      And I fill in "Password confirmation" with "colgate"
      And I press "Sign up"
      Then I should not see "Gross Spinach"
