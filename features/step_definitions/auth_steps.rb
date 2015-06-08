Given /^I am signed out$/ do
  delete '/users/sign_out'
end

Given /^I am signed in$/ do
  user = create :user
  visit '/users/sign_in'
  fill_in 'Email', with: user.email
  fill_in 'Password', with: 'password'
  click_button 'Sign in'
end
