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


    Scenario: Delete a blog post unsuccessfully
      Given I am on the blog posts page
      When I click on post "Gross Spinach"
      And I follow "Delete"
      And I follow "Sign up"
      And I fill in "Email" with "me@email.com"
      And I fill in "user_password" with "colgate"
      And I fill in "Password confirmation" with "colgate"
      And I press "Sign up"
      Then I should not see "Gross Spinach"


    Scenario: Delete a blog post successfully
      When I follow "New Post"
      And I follow "Sign up"
      And I fill in "Email" with "adds@email.com"
      And I fill in "user_password" with "colgate"
      And I fill in "Password confirmation" with "colgate"
      And I press "Sign up"
      When I fill in the following:
        | Title                     | saladc                    |
        | How was it?               | Good                      |
        | Rating                    | 2                         |

      When I select "Lunch" from "Meal Time"
      When I select "Coop" from "Location"
      When I press "Create A New Blog Post"
      Then I should be on the blog posts page
      And I should see "saladc"
      And I should see that "saladc" has a rating of 2
      And I should see that "saladc" has a Meal Time of "Lunch"
      And I should see that "saladc" has a Location of "Coop"
      When I click on post "saladc"
      When I follow "Delete"
      And I fill in "Email" with "adds@email.com"
      And I fill in "user_password" with "colgate"
      And I check "user_remember_me"
      And I press "Log in"
      When I click on post "saladc"
      When I follow "Delete"
      Then I should see "Blog Post 'saladc' deleted!"


    Scenario: Delete a blog post unsuccessfully
      When I follow "New Post"
      And I follow "Sign up"
      And I fill in "Email" with "adds@email.com"
      And I fill in "user_password" with "colgate"
      And I fill in "Password confirmation" with "colgate"
      And I press "Sign up"
      When I fill in the following:
        | Title                     | saladd                    |
        | How was it?               | Good                      |
        | Rating                    | 2                         |

      When I select "Lunch" from "Meal Time"
      When I select "Coop" from "Location"
      When I press "Create A New Blog Post"
      Then I should be on the blog posts page
      And I should see "saladd"
      And I should see that "saladd" has a rating of 2
      And I should see that "saladd" has a Meal Time of "Lunch"
      And I should see that "saladd" has a Location of "Coop"
      When I click on post "saladd"
      When I follow "Delete"
      And I follow "Sign up"
      And I fill in "Email" with "adiff@email.com"
      And I fill in "user_password" with "colgate"
      And I fill in "Password confirmation" with "colgate"
      And I press "Sign up"
      And I click on post "saladd"
      When I follow "Delete"
      And I fill in "Email" with "adiff@email.com"
      And I fill in "user_password" with "colgate"
      And I check "user_remember_me"
      And I press "Log in"
      And I click on post "saladd"
      And I follow "Delete"
      Then I should see "You don't have permission to do that."

