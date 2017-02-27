require 'rails_helper'

describe "sign-in process" do
  it "allows a user to sign-in" do

     visit '/users/sign_up'
     fill_in 'user[user_name]', with: 'orthogo'
     fill_in 'user[email]', with: 'test79@mail.com'
     fill_in 'user[password]', with: '987b987'
     fill_in 'user[password_confirmation]', with: '987b987'
     click_on 'Sign up'
     click_on 'Sign Out'


   visit '/users/sign_in'
   fill_in 'user[email]', with: 'test79@mail.com'
   fill_in 'user[password]', with: '987b987'
   click_on 'Log in'
   expect(page).to have_content 'Orthogo'
 end
end
