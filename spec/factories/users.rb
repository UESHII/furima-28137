FactoryBot.define do
  factory :user do
    nickname              {"Yamada"}
    email                 {"example@example.com"}
    password              {"abc123"}
    password_confirmation {password}
    family_name           {"山田"}
    first_name            {"太郎"}
    kana_family_name      {"ヤマダ"}
    kana_first_name       {"タロウ"}
    birthday              {"2020-10-13"}
  end
end
