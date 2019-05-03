Feature: Filter and sort rental properties
  As a blogger
  so that I can find posts that interest me
  I want to be able to sort and filter blog posts

  Background: the website already has some existing blog posts
    Given I am an authenticated user with email: "bob@email.com"
    When I follow "New Post"
    And I follow "Sign up"
    And I fill in "Email" with "me@email.com"
    And I fill in "user_password" with "colgate"
    And I fill in "Password confirmation" with "colgate"
    And I press "Sign up"
    Given these BlogPosts:
      | title          | category            | location | description                                   | rating       | user_id |
      | Gross Spinach  | Dinner              | Frank    | watery, and glowing green.                    | 1/5 Stars    | 1       |
      | Clam Chowder   | Lunch               | Coop     | pretty good, feels like i'm back in Boston.   | 4/5 Stars    | 1       |

  Scenario: filter by location
    When I go to the blog posts page
    And I select "Frank" from "Location"
    And I press "Refine the list of blog posts"
    Then I should be on the blog posts page
    And I should see "Gross Spinach"
    But I should not see "Clam Chowder"

  Scenario: filter by category
    When I go to the blog posts page
    And I select "Lunch" from "Meal Time"
    And I press "Refine the list of blog posts"
    Then I should be on the blog posts page
    And I should see "Clam Chowder"
    But I should not see "Gross Spinach"
