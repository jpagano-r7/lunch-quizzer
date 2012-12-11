Feature: Find a place for lunch
  In order to build the team sprit
  As a lunch organizer
  I want to have a list of places we can go for lunch
  
  Scenario: Restaurants in common
    Given we have a user "Adam" who likes the following restaurants:
    | name        |
    | Red Robin   |
    | Jimmy Johns |
    | Pizza Hut   |
    And we have the user "Beth" who likes the following restaurants:
    | name           |
    | Wendys         |
    | Red Robin      |
    | Macaroni Grill |
    And we have the user "Charlie" who likes the following restaurants:
    | name                |
    | Salt Lick Bar-B-Que |
    | Outback steakhouse  |
    | Red Robin           |
    When I set up a lunch event, with:
    | name    |
    | Adam    |
    | Beth    |
    | Charlie |
    Then I should get "Red Robins" as a result
  
  Scenario: Have we been here before?
    Given we have the following users:
    | name      |
    | Alice     |
    | Brian     |
    | Catherine |
    And they all like the following restaurants:
    | name               |
    | Red Robin          |
    | Outback steakhouse |
    | Macaroni Grill     |
    And the user "Alice" has been to "Red Robin", "2" weeks ago
    And the user "Brian" has been to "Macaroni Grill", "3" weeks ago
    When I set up a lunch event, with:
    | name      |
    | Alice     |
    | Brian     |
    | Catherine |
    And The event is configured to remove any place people have been within the last 2 weeks
    Then I should see:
    | name               |
    | Outback steakhouse |
    | Macaroni Grill     |
  
  
  
