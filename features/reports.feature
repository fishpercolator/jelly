Feature: Report management

  Scenario: Can't view reports when signed out
    Given I am signed out
    And I visit today's reports
    Then I should see an error

  Scenario: Can create report
    Given I am signed in
    And I visit the new report page
    And I fill in yesterday as the previous working day
    And I select jelly baby 5
    And I fill in these details:
      | field                                 | value                 |
      | report_excited                        | Being a test          |
      | report_achievements_attributes_0_text | Tested something      |
      | report_achievements_attributes_1_text | Tested something else |
      | report_achievements_attributes_2_text | Tested something more |
      | report_tasks_attributes_0_text        | Will test             |
      | report_tasks_attributes_1_text        | Will test more        |
      | report_tasks_attributes_2_text        | Will test even more   |
    And I click "Create Report"
    Then I should be on the show report page
    And I should see the text "I am most excited about: Being a test"
    And I should see the text "Yesterday I achieved: Tested something Tested something else Tested something more"
    And I should see jelly baby 5
