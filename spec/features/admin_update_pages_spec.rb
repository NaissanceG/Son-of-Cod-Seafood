require 'rails_helper'

describe "update a product" do
  it "will allow an admin to update a product to the website" do
    user = FactoryGirl.create(:user, admin: true)
    login_as(user, :scope => :user)
    visit root_path
    click_on "Add New Product"
    product = FactoryGirl.create(:product, name: "Getrotesting")
    fill_in 'product[name]', :with => product.name
    fill_in 'product[description]', :with => product.description
    fill_in 'product[species]', :with => product.species
    fill_in 'product[price]', :with => product.price
    fill_in 'product[origin]', :with => product.origin
    click_on "submit"
    visit edit_product_path(product)
    fill_in 'product[name]', :with => 'Getro_Bear'
    click_on 'submit'
    expect(page).to have_content 'The product has been successfully updated'
  end


  it "will prevent a basic user from adding a product" do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit root_path
    product = FactoryGirl.create(:product, name: "Getrotesting")
    visit edit_product_path(product)
    expect(page).to have_content 'You are not an admin'
 end
end
