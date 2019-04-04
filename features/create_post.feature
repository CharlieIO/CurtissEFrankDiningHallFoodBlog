Feature: Create a new Blog Post
  As a user
  So that I can share a meal at Colgate
  I want to be able to add a new blog post.

  Scenario: Create a new blog post
    Given I am on the create a new blog post page
    When I fill in the following:
      | Title                     | salad                     |
      | How was it?               | Good                      |
      | Rating                    | 4                         |

    When I select "Lunch" from "Meal Time"
    When I select "Frank" from "Location"
    When I press "Create A New Blog Post"
    Then I should be on the blog posts page
    And I should see "salad"
    And I should see that "salad" has a rating of 4
    And I should see that "salad" has a Meal Time of "Lunch"
    And I should see that "salad" has a Location of "Frank"

  Scenario: Try to create a new blog post without filling out form
    Given I am on the create a new blog post page
    When I fill in the following:
      | Title                     |                           |
      | How was it?               |                           |
      | Rating                    |                           |

    And I press "Create A New Blog Post"
    Then I should be on the create a new blog post page
    And I should see "No Location Provided - Failed to Create Blog Post."

  Scenario: Try to create a new blog post without filling out form
    Given I am on the create a new blog post page
    When I fill in the following:
      | Title                     |                           |
      | How was it?               |                           |
      | Rating                    |                           |

    And I select "Frank" from "Location"
    And I press "Create A New Blog Post"
    Then I should be on the create a new blog post page
    And I should see "No Title Provided - Failed to Create Blog Post."


    Scenario: Try to create a new blog post without filling out form
      Given I am on the create a new blog post page
      When I fill in the following:
        | Title                     | Squash                    |
        | How was it?               |                           |
        | Rating                    |                           |

      And I select "Frank" from "Location"
      And I press "Create A New Blog Post"
      Then I should be on the create a new blog post page
      And I should see "No Rating Provided - Failed to Create Blog Post."

    Scenario: Try to create a new blog post without filling out form
      Given I am on the create a new blog post page
      When I fill in the following:
        | Title                     | Squash                    |
        | How was it?               |                           |
        | Rating                    | 5                         |

      And I select "Frank" from "Location"
      And I press "Create A New Blog Post"
      Then I should be on the create a new blog post page
      And I should see "No Meal Time Provided - Failed to Create Blog Post."
