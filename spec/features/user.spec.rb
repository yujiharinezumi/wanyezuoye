require 'rails_helper'

RSpec.feature "ユーザー機能", type: :feature do

  background do
    @user1 = User.create!(name:"a",email:"a@gmail.com",password:"aaaaaa",password_confirmation:"aaaaaa")

  end

  scenario "ユーザー登録のテスト" do

    visit new_user_path
    fill_in "user_name",with: 'a'
    fill_in "user_email",with:"a@gmail.com"
    fill_in "user_password",with:"aaaaaa"
    fill_in "user_password_confirmation",with:"aaaaaa"

    click_button 'commit'

    visit user_path(@user1)

    expect(page).to have_content 'a@gmail.com'
  end

  scenario "ユーザー登録失敗のテスト" do

  visit new_user_path

  click_button 'commit'

  expect(page).to have_content '名前を入力してください'
  expect(page).to have_content 'メールアドレスを入力してください'
  expect(page).to have_content 'メールアドレスは不正な値です'
  expect(page).to have_content 'パスワードを入力してください'
  expect(page).to have_content 'パスワードは6文字以上で入力してください'
  end

  scenario "ログインできるかテスト" do
    visit new_session_path

    fill_in "session_email",with: "a@gmail.com"
    fill_in "session_password",with: "aaaaaa"

    visit user_path(@user1)

    expect(page).to have_content 'a@gmail.com'
  end

  scenario "ログイン失敗のテスト" do
    visit new_session_path

    expect(page).to have_content 'ログインに失敗しました'
  end

  scenario "ログインしてない人はタスク一覧を見れないテスト" do
    visit tasks_path


  end

  scenario "ログインしている人は他人のユーザーを見ることができない" do
    visit user_path(@user2)

    expect(page).to have_content(権限がありません)
  end
end
