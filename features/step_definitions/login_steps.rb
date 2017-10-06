require 'calabash-android/calabash_steps'

# When("I enter {string} to {string} text box") do |value, field| # this is a valid way too
When(/^I enter "([^\"]*)" to "([^\"]*)" text box$/) do |value, field| # this is the regex way
    enter_text("* marked:'#{field}'", value)
end

When("I tap the {string}") do |field|
    touch("* marked:'#{field}'")
    sleep 1
end