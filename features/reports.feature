Feature: Report management

  Scenario: Can't view reports when signed out
    Given I am signed out
    And I visit today's reports
    Then I should see an error
