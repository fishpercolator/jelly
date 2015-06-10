Feature: Report management

  Scenario: Can't view reports when signed out
    Given I am signed out
    When I visit today's reports
    Then I should see an error

  Scenario: Can create report
    Given I am signed in
    When I visit the new report page
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
    And I click the button "Create Report"
    Then I should be on the show report page
    And I should see the text "I am most excited about: Being a test"
    And I should see the text "Yesterday I achieved: Tested something Tested something else Tested something more"
    And I should see jelly baby 5

  Scenario: Today's index
    Given I am signed in
    And There are 6 users with reports
    When I visit today's reports
    Then I see 6 reports

  @javascript
  Scenario: Datepicker works
    Given I am signed in
    When I visit the new report page
    And I click the field "report_previous_day"
    Then a datepicker appears
    When I click on date 15
    Then "report_previous_day" shows the 15th of this month

  @javascript
  Scenario: Jelly changing works
    Given I am signed in
    When I visit the new report page
    And I select jelly baby 13
    Then I should see jelly baby 13
