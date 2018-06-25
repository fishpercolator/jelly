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
    And I should see the text "I am most excited about:\nBeing a test"
    And I should see the text "Yesterday I achieved:\nTested something Tested something else Tested something more"
    And I should see jelly baby 5

  Scenario: Can edit report
    Given I am signed in
    And I have 1 past report
    When I visit my most recent report
    And I click the button "Edit"
    And I fill in these details:
      | field              | value                         |
      | report_excited     | New value                     |
      | report_help_needed | On two lines\nWith *markdown* |
    And I select jelly baby 10
    And I click the button "Update Report"
    Then I should be on the show report page
    And I should see the text "I am most excited about:\nNew value"
    And I should see the html "<p>On two lines<br>With <em>markdown</em></p>"
    And I should see jelly baby 10
    And I should see 3 achievements and 3 tasks

  Scenario: Cannot edit someone else's report
    Given I am signed in
    And there are 2 users with reports
    When I try to edit another user's report
    Then I should see an error

  Scenario: Today's index
    Given I am signed in
    And there are 6 users with reports
    When I visit today's reports
    Then I should see 6 reports

  Scenario: Presentation mode
    Given I am signed in
    And there are 6 users with reports
    When I visit today's reports
    And I click the button "present"
    Then I should see a presentation
    And there should be 6 reports in the presentation

  @javascript
  Scenario: Datepicker works
    Given I am signed in
    When I visit the new report page
    And I click the field "report_previous_day"
    Then a datepicker should appear
    When I click on date 15
    Then "report_previous_day" should show the 15th of this month

  @javascript
  Scenario: Jelly changing works
    Given I am signed in
    When I visit the new report page
    And I select jelly baby 13
    Then I should see jelly baby 13

  Scenario: User's own reports
    Given I am signed in
    And I have 15 reports this month
    When I visit my reports page
    Then I should see 15 links on a calendar

  Scenario: Reports by day
    Given I am signed in
    And there are 6 reports today and 8 reports yesterday
    When I visit the all reports page
    Then I should see today's date marked with 6
    And I should see yesterday's date marked with 8
