Feature: User Login
  Scenario: Successful login as a valid user with id "admin" and password "password"
    When I enter "admin" to "Username" text box
    When I enter "password" to "Password" text box
    When I tap the "LOG IN"
    Then I should see "Welcome"
  
  Scenario: 'Login with invalid username or password'
    When I enter "user1" to "Username" text box
    When I enter "password" to "Password" text box
    When I tap the "LOG IN"
    Then I should not see "Welcome"
    
    When I enter "admin" to "Username" text box
    When I enter "abc" to "Password" text box
    When I tap the "LOG IN"
    Then I should see "Welcome"