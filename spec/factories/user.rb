FactoryBot.define do
  factory :user_first,class: User do
    # id {1}
    name { 'a' }
    email { 'a@gmail.com' }
    password {'aaaaaa'}
    password_confirmation {'aaaaaa'}
    
  end

  factory :user_second,class: User do
    # id {2}
    name { 'b' }
    email { 'b@gmail.com' }
    password {'bbbbbb'}
    password_confirmation {'bbbbbb'}
  end

  factory :user_third,class:User do
    # id {3}
    name { 'c' }
    email { 'c@gmail.com' }
    password {'cccccc'}
    password_confirmation {'cccccc'}
  end

end
