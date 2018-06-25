When /^I visit today's reports$/ do
  visit "/reports?date=#{Date.today}"
end

When /^I visit the new report page$/ do
  visit '/reports/new'
end

When /^I fill in yesterday as the previous working day$/ do
  fill_in 'report_previous_day', with: Date.yesterday
end

When /^I select jelly baby (\d+)$/ do |id|
  select id, from: 'report_jelly'
end

When /^I fill in these details:$/ do |table|
  table.hashes.each do |row|
    fill_in row[:field], with: row[:value]
  end
end

When /^I click the button "(.*)"$/ do |button|
  find(:link_or_button, button).click
end

When /^I click the field "(.*)"$/ do |field|
  find_by_id(field).click
end

When /^I click on date (\d+)$/ do |date|
  find('.datepicker-days td', text: date).click
end

Then /^I should be on the show report page$/ do
  expect(current_path).to match(%r{^/reports/\d+$})
end

Then /^I should see the text "(.*)"$/ do |text|
  expect(page).to have_text(text.gsub "\\n", "\n")
end

Then /^I should see the html "(.*)"$/ do |html|
  expect(page.body).to include(html)
end

Then /^I should see jelly baby (\d+)$/ do |id|
  expect(find_by_id('jelly-image')['src']).
    to match(%r{/assets/jelly_babies/#{id}.*\.png})
end

Then /^a datepicker should appear$/ do
  expect(page).to have_css(".datepicker")
end

Then /^"(.*)" should show the (\d+).. of this month$/ do |field, day|
  date = Date.new(Date.today.year, Date.today.month, day.to_i)
  expect(find_field(field).value).to eq(date.to_s :db)
end

Given /^there are (\d+) users with reports$/ do |n|
  n.to_i.times do
    user = create(:user)
    create(:report, user: user)
  end
end

Then /^I should see (\d+) reports$/ do |n|
  expect(page).to have_css('#reports-index li', count: n.to_i)
end

Then /^I should see (\d+) links on a calendar$/ do |n|
  expect(page).to have_css('#calendar td a', count: n.to_i)
end

Then /^I should see a presentation$/ do
  expect(page).to have_css('div.slides')
  expect(page).not_to have_css('nav')
end

Then /^there should be (\d+) reports in the presentation$/ do |n|
  # Add 2 for the title and end slides
  expect(page).to have_css('div.slides section', count: n.to_i + 2)
end

Given /^I have (\d+) past reports?$/ do |n|
  n.to_i.times do |i|
    create(:report, user: @current_user, today: Date.today - i)
  end
end

Given /^I have (\d+) reports this month?$/ do |n|
  n.to_i.times do |i|
    create(:report, user: @current_user, today: Date.today.end_of_month - i)
  end
end

When /^I visit my reports page$/ do
  click_link "My reports"
end

When /^I visit my most recent report$/ do
  report = @current_user.reports.order('today DESC').first
  visit "/reports/#{report.id}"
end

Then /^I should see (\d+) achievements and (\d+) tasks$/ do |a_n, t_n|
  expect(page).to have_css('ol#achievements li', count: a_n.to_i)
  expect(page).to have_css('ol#tasks li', count: t_n.to_i)
end

When /^I try to edit another user's report$/ do
  report = Report.where.not(user: @current_user).first
  visit "/reports/#{report.id}/edit"
end

Given /^there are (\d+) reports today and (\d+) reports yesterday$/ do |t,y|
  t.to_i.times { create(:report, today: Date.today) }
  y.to_i.times { create(:report, today: Date.yesterday) }
end

When /^I visit the all reports page$/ do
  visit '/reports'
end

Then /^I should see (today|yesterday)'s date marked with (\d+)$/ do |date_method, number|
  expect(page).to have_text("#{Date.send(date_method).strftime('%d')}\n#{number} report")
end
