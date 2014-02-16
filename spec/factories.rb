FactoryGirl.define do
  factory :user do
    username "Pekka"
    password "Foobar1"
    password_confirmation "Foobar1"
  end

  factory :style do
    name "Lager"
    description "Tosi hieno olut jne"
  end

  factory :style2, class:Style do
    name "IPA"
    description "cool"
  end


  factory :user2, class: User do
    username "Jani"
    password "Foobar1"
    password_confirmation "Foobar1"
  end

  factory :rating do
    score 10
  end

  factory :rating2, class: Rating do
    score 20
  end

  factory :brewery do
    name "anonymous"
    year 1900
  end

  factory :beer do
    name "anonymous"
    brewery
    style
  end

end
