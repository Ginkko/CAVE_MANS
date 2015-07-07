FactoryGirl.define do

  factory(:user) do
    name('Rock')
    email('Rock@Rock.rk')
    password('smash')
    password_confirmation('smash')
  end

  factory(:question) do
    name('LOL')
    body('test body')
  end

  factory(:answer) do
    content('Rock')
  end

end
