When /^I visit today's reports$/ do
  visit "/reports?date="+Date.today.to_s(:db)
end
