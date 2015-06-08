When /^I visit today's reports$/ do
  visit '/reports?date='+Date.today.to_s(:db)
end

When /^I visit the new report page$/ do
  visit '/reports/new'
end

When /^I fill in yesterday as the previous working day$/ do
  fill_in 'report_previous_day', with: Date.yesterday.to_s(:db)
end

When /^I select jelly baby (\d+)$/ do |id|
  select id, from: 'report_jelly'
end

When /^I fill in these details:$/ do |table|
  table.hashes.each do |row|
    fill_in row[:field], with: row[:value]
  end
end

When /^I click "(.*)"$/ do |field|
  click_button field
end

Then /^I should be on the show report page$/ do
  expect(current_path).to match(%r{^/reports/\d+$})
end

Then /^I should see the text "(.*)"$/ do |text|
  expect(page).to have_text(text)
end

Then /^I should see jelly baby (\d+)$/ do |id|
  expect(page).to have_css("img[alt='Jelly baby #{id}']")
end
