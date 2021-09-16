FactoryGirl.define do
    factory :user_profile do |f|
        f.email "rishavk@gmail.com"
        f.password "Password123"
        f.first_name "Rishav"
        f.last_name "Kumar"
        f.phone_number "+917992279560"
    end
end
