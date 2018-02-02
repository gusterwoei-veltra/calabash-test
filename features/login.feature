Feature: User Login
  Scenario: Successful login as a valid user with id "admin" and password "password"
    When I enter "admin" to "Username" text box
    When I enter "password" to "Password" text box
    When I tap the "LOG IN" button
    Then I should see the "Welcome"
    When I tap the "LOGOUT" button
    Then I should be logged out
  
  Scenario: Login with invalid username or password
    # wrong username
    When I enter "user1" to "Username" text box
    When I enter "password" to "Password" text box
    When I tap the "LOG IN" button
    Then I should not see "Welcome"
    # wrong password
    When I enter "admin" to "Username" text box
    When I enter "abc" to "Password" text box
    When I tap the "LOG IN" button
    Then I should not see "Welcome"