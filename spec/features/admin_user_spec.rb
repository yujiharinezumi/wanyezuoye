require 'rails_helper'
require 'support/utilities'

RSpec.feature "アドミン機能", type: :feature do
  background do
    @admin = FactoryBot.create(:admin_user)
    @user1 = FactoryBot.create(:user_first)
  end

  scenario "アドミンユーザーか確認するテスト" do
    log_in @admin
    expect(page).to have_content 'ユーザー一覧'
  end

  scenario "ユーザー一覧を確認できるかのテスト" do
    log_in @admin
    visit admin_users_path
    expect(page).to have_text 'a'
    expect(page).to have_text 'a@gmail.com'
  end

  scenario "ユーザーの作成のテスト" do
    log_in @admin
    visit new_admin_user_path
    fill_in "user_admin_name",with: 'sugaya'
    fill_in "user_admin_email",with:"sugaya@gmail.com"
    fill_in "user_admin_password",with:"sugaya"
    fill_in "user_admin_password_confirmation",with:"sugaya"
    check "user_admin"
    # save_and_open_page
    click_button 'commit'
  end

  scenario "既存ユーザーの編集テスト" do
      log_in @admin
      visit edit_admin_user_path(@user1)
      fill_in "user_name",with: 'bbbbbb'
      fill_in "user_email",with:"bbbbbb@gmail.com"
      check "user_admin"
      click_button 'commit'
      expect(page).to have_text 'ユーザを更新しました'
  end

  scenario "既存ユーザーの削除のテスト" do
    log_in @admin
    visit admin_users_path
     all('tr td')[13].click_link
     expect(page).to have_content '削除しました'
         # save_and_open_page
  end
end
