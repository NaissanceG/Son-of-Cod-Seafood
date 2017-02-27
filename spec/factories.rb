include ActionDispatch::TestProcess



FactoryGirl.define do
  factory(:product) do
    name('gummy_bear')
    description('It is honestly quite lovely')
    species('bearinorious')
    price('12')
    origin('Pdx')
    user_id('1')
    image { fixture_file_upload(Rails.root.join('spec', 'photos', 'test.png'), 'image/png') }
    user
  end
end

FactoryGirl.define do
  before(:each) do
      @user = User.new
      @user.user_name = "a valid username"
   end

  factory(:user) do
    sequence(:email) { |n| "#{n}@example.com" }
    user_name 'merde'
    password 'passwod'
    password_confirmation { password }

  factory :admin do
     admin true
    end
  end
end

FactoryGirl.define do
  factory(:comment) do
    content('gummy bear is seriously ok')
    product
    user
  end
end
