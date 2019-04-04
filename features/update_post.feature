Feature: Be able to update an existing blog post
  As a food enthusiast
  so that I can change what I thought about my meal
  I want to be able to update the information I put in my blog post.

  Background: the site already has an existing blog post
    Given these RentalProperties:
      | Title          | Category            | Location | Description                      | Rating       |
      | Gross Spinach  | Dinner              | Frank    | watery, and glowing green.       | 1/5 Stars    |


  Scenario: Be able to update an existing blog post
    Given I am on the blog posts page
    When I follow "Gross Spinach"
    Then I should see "Dinner"
    And I should see "Frank"
    And I should see "watery, and glowing green."
    And I should see "1/5 Stars"
    When I follow "Edit post details"
    And I select "Lunch" from "Meal Time"
    And I select "Coop" from "Location"
    And I press "Edit Blog Post"
    Then I should see "Lunch"
    And I should see "Coop"
