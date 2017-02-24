require 'rails_helper'

describe User do
  it { should validate_presence_of :user_name }
  it { should have_many :products }
  it { should have_many :comments }
end
