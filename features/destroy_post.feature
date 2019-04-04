Feature: Delete a Blog Post
  As a user
  So that I can delete a post I don't want to share anymore
  I want to be able to delete my blog post and all of its details.


  Background: the site already has an existing blog post
    Given these RentalProperties:
      | Title          | Category            | Location | Description                      | Rating       |
      | Gross Spinach  | Dinner              | Frank    | watery, and glowing green.       | 1/5 Stars    |


  Scenario: Delete a blog post
    Given I am on the blog posts page
    When I follow "Gross Spinach"
    And I follow "Delete post"
    Then I should see "Blog Post 'Gross Spinach' deleted!"
