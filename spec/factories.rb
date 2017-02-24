FactoryGirl.define do
  factory(:product) do
    name('gummy_bear')
    description('It is honestly quite lovely')
    species('bearinorious')
    price('12')
    origin('Pdx')
  end
end

FactoryGirl.define do
  factory(:user) do
    user_name('gummy')
  end
end

FactoryGirl.define do
  factory(:comment) do
    content('gummy bear is very very delicious')
  end
end
