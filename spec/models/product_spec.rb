require 'rails_helper'


describe Product do
  it "has a valid factory" do
    expect(FactoryGirl.build(:product)).to be_valid
  end

  it { should validate_presence_of :name }
  it { should validate_presence_of :description }
  it { should validate_presence_of :species }
  it { should validate_presence_of :price }
  it { should validate_presence_of :origin }
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :image }
  it { should belong_to :user }
  it { should have_many :comments }
end
