FactoryGirl.define do
  factory :book do
    sequence(:title) {|n| "Book #{n}"}
    sequence(:code) {|n| "b#{n}"}
    stock 1
  end

  factory :patron do
    sequence(:name) {|n| "Patron #{n}"}
    sequence(:code) {|n| "p#{n}"}
  end
end