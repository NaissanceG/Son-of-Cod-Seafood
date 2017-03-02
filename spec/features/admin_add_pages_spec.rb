require 'rails_helper'

describe "adding a product" do
  it "will allow an admin to add a product to the website" do
    user = FactoryGirl.create(:user, admin: true)
    login_as(user, :scope => :user)
    visit root_path
    click_on "Add New Product"
    product = FactoryGirl.create(:product)
    fill_in 'product[name]', :with => product.name
    fill_in 'product[description]', :with => product.description
    fill_in 'product[species]', :with => product.species
    fill_in 'product[price]', :with => product.price
    fill_in 'product[origin]', :with => product.origin
    click_on "submit"
    expect(page).to have_content 'The Product has been successfully added'
  end

  it "will prevent a basic user from adding a product" do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit root_path
    visit new_product_path
    expect(page).to have_content 'You are not an admin'
 end

end
