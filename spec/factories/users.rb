FactoryBot.define do
  factory :user do
    password              {"aaaa0000"}
    email                 {Faker::Internet.free_email}
    nick_name             {"やまたろ"}
    first_name            {"山田"}
    last_name             {"太郎"}
    katakana_first_name   {"ヤマダ"}
    katakana_Last_name    {"タロウ"}
    birthday              {"2000-01-01"}
  end
end