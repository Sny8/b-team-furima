FactoryBot.define do
  
  factory :user do
    nickname               {"masato"}
    email                  {"ttt@gmail.com"}
    password               {"0000000"}
    password_confirmation  {"0000000"}
    first_name             {"まさと"}
    family_name            {"田中"}
    first_name_kana        {"マサト"}
    family_name_kana       {"タナカ"}
    birth_date             {"1990-01-01"}
  end
end