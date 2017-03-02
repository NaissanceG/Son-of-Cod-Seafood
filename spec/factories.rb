include ActionDispatch::TestProcess

FactoryGirl.define do

  factory :product do
    name 'gumy_bear'
    description 'It is hnesty quite lovely'
    species 'berinorious'
    price '12'
    origin 'Px'
    user_id '19'
    image { fixture_file_upload(Rails.root.join('spec', 'photos', 'test.png'), 'image/png') }
    user
  end

  trait :with_comments do
    after :create do |product|
      FactoryGirl.create_list :comment, :product => product
    end
  end

  factory :user  do
    sequence (:email)  {|n| "persodn#{n}@example.com" }
    sequence (:user_name) {|n| "merfdlo #{n}" }
    password 'passwodsd'
    password_confirmation 'passwodsd'
    admin   false
  end


  factory :comment  do
    content 'gummy bear is seriously ok'
    product
    user
  end
  
end
