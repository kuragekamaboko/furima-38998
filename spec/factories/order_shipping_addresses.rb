FactoryBot.define do
  factory :order_shipping_address do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code {'123-4567'}
    city {'テスト件'}
    addresses {'テスト市'}
    phone_number {1234567890}
    prefecture_id {1}
  end
end
