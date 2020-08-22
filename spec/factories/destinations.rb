FactoryBot.define do
  
  factory :destination do
    first_name             {"まさと"}
    family_name            {"田中"}
    first_name_kana        {"マサト"}
    family_name_kana       {"タナカ"}
    post_code              {"123-4567"}
    prefecture_code        {"0"}
    city                   {"札幌"}
    block                  {"1-1-1"}
    user_id                {"1"}
  end
end