require 'calabash-android/calabash_steps'

WAIT_TIMEOUT = 60.to_f

# When("I enter {string} to {string} text box") do |value, field| # this is a valid way too
When(/^I enter "([^\"]*)" to "([^\"]*)" text box$/) do |value, field| # this is the regex way
    query("* marked:'#{field}'", setText: "")
    enter_text("* marked:'#{field}'", value)
end

When(/^I (tap|click|press) the "(.*?)"/) do |action, field|
    touch("* marked:'#{field}'")
    sleep 1
end

Then(/^I should see the "([^\"]*)"$/) do |text|
    wait_for_elements_exist("* marked:'#{text}'")
end

Then "I should be logged out" do
    view = query("* marked:'Password'").first
    if view.nil?
        fail 'Did not logout successfully'
    end
end