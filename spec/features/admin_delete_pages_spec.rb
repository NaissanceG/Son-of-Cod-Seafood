require 'rails_helper'

describe "update a product" do
  it "will allow an admin to delete a product to the website" do
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
    visit product_path(product)
    click_on 'Delete'
    expect(page).to have_content 'Your Post has been deleted!'
  end

end
