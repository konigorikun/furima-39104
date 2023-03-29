FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              { '1a' + Faker::Internet.password(min_length: 4)}
    password_confirmation {password}
    firstname             {person.first.kanji}
    lastname              {person.last.kanji}
    firstname_kana        {person.first.katakana}
    lastname_kana         {person.last.katakana}
    date_of_birthday      {Faker::Date.backward}
  end
end