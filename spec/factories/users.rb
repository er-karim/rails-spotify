FactoryBot.define do
  generated_passwor = Faker::Internet.password

  factory :user do
    email { Faker::Internet.email }
    password { generated_passwor }
    password_confirmation { generated_passwor }
  end
end
