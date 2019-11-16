require 'rails_helper'
require 'support/utilities'

RSpec.feature "ラベル管理", type: :feature do
  background do



    @user_1 = FactoryBot.create(:user_first)
    @label_1 = FactoryBot.create(:label_first)
    @task1 = FactoryBot.create(:task_first, user_id: @user_1.id)
  end

  scenario "ラベルの登録のテスト" do
    log_in @user_1
    visit new_label_path
    fill_in 'label[name]',with:'work'
    click_button 'commit'
    expect(page).to have_content "ラベルを作成しました"
  end

    scenario "ラベルの削除のテスト" do
        log_in @user_1
        visit new_label_path
        fill_in 'label[name]',with:'work'
        click_button 'commit'

         all('tr td')[1].click_link
         expect(page).to have_content 'ラベルを削除しました。'
    end
end
