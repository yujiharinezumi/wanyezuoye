require 'rails_helper'
require 'support/utilities'

RSpec.feature "ユーザー機能", type: :feature do

  background do
    @user1 = FactoryBot.create(:user_first)
    @user2 = FactoryBot.create(:user_second)
  end

  scenario "ユーザー登録のテスト" do
    visit new_user_path
    fill_in "user_name",with: 'a'
    fill_in "user_email",with:"a@gmail.com"
    fill_in "user_password",with:"aaaaaa"
    fill_in "user_password_confirmation",with:"aaaaaa"
    click_button 'commit'
    expect(page).to have_content "a@gmail.com"
  end

  scenario "ユーザー登録失敗のテスト" do
    visit new_user_path
    click_button 'commit'
    expect(page).to have_content '名前を入力してください'
    expect(page).to have_content 'メールアドレスを入力してください'
    expect(page).to have_content 'パスワードを入力してください'
  end

  scenario "ログインできるかテスト" do
    log_in @user1
    expect(page).to have_content 'a@gmail.com'
  end

  scenario "ログイン失敗のテスト" do
    visit new_session_path
    click_button 'commit'
    expect(page).to have_content 'ログインに失敗しました'
  end

  scenario "ログアウトのテスト" do
    log_in @user1
    click_on 'ログアウト'
    expect(page).to have_content "ログアウトしました"
  end

  scenario "ログインしてない人はタスク一覧を見れないテスト" do
    visit tasks_path
    expect(page).to have_content "Log in"
  end

  scenario "ログインしている人は他人のユーザーを見ることができない" do
    log_in @user1
    visit user_path(@user2.id)
    expect(page).to have_content "権限がありません"
  end
end
