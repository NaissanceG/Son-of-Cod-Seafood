require 'rails_helper'

describe "sign-up process" do
  it "adds a new user" do
   visit '/users/sign_up'
   fill_in 'user[user_name]', with: 'portlan'
   fill_in 'user[email]', with: 'test99@mail.com'
   fill_in 'user[password]', with: '987987'
   fill_in 'user[password_confirmation]', with: '987987'
   click_on 'Sign up'
   expect(page).to have_content 'Portlan'
 end
end
