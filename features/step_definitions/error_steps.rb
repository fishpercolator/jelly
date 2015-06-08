Then /^I should see an error$/ do
  expect(page).to have_css('.alert-danger')
end
