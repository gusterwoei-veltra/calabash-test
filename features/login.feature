Feature: User Login
  Scenario: Successful login as a valid user with id "admin" and password "password"
    When I enter "admin" to "Username" text box
    When I enter "password" to "Password" text box
    When I tap the "LOG IN"
    Then I should see "Welcome"