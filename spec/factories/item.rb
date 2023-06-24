FactoryBot.define do
  factory :item do
    name {'てすと'}
    info {'商品の説明'}
    category_id {1}
    sales_status_id {1}
    shipping_fee_status_id {1}
    prefecture_id {1}
    price {300}              
    scheduled_delivery_id {1}
    image {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/images/test_image.png'))}
    user

  end
end