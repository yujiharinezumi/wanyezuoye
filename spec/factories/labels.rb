FactoryBot.define do
  factory :label_first,class: Label do
    name { "work" }
  end

  factory :label_second,class: Label do
    name { "friend" }
  end
end
