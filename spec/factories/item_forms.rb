FactoryBot.define do
  factory :item_form do
    postal   { '123-4567' }
    area_id  { 2 }
    city     { '横浜市緑区' }
    address  { '青山1-1-1' }
    building { '柳ビル103' }
    phone    { '09012345678' }
    token    {"tok_abcdefghijk00000000000000000"}
  end
end