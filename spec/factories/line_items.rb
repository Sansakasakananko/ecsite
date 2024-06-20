FactoryBot.define do
  factory :line_item do
    book { nil }
    cart { nil }
    quantity { 1 }
  end
end
