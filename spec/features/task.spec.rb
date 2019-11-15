require 'rails_helper'
require 'support/utilities'

RSpec.feature "タスク管理機能", type: :feature do
  background do
    @user_1 = FactoryBot.create(:user_first)
    @user_2 = FactoryBot.create(:user_second)
    @label_1 = FactoryBot.create(:label_first)
    @label_2 = FactoryBot.create(:label_second)
    @task1 = FactoryBot.create(:task_first, user_id: @user_1.id)
    @task3 = FactoryBot.create(:task_third, user_id: @user_1.id)
    @task2 = FactoryBot.create(:task_second, user_id: @user_2.id)
  end

  scenario "タスク一覧のテスト" do
    log_in @user_1
    visit tasks_path

    expect(page).to have_content 'testtesttest'
    expect(page).to have_content 'samplesample'
    expect(page).to have_content 'samplesample'
  end

  scenario "タスク作成のテスト" do
   log_in @user_1
   visit new_task_path

  fill_in "task[name]",with: 'a'
  fill_in "task[content]",with: 'a'
  click_button 'commit'
  expect(page).to have_content 'a'
  expect(page).to have_content 'a'
  end

  scenario "タスク詳細のテスト" do
    log_in @user_1
    visit task_path(@task1)
    expect(page).to have_content 'test_task_01'
  end

  scenario "タスクが作成日時の降順に並んでいるかのテスト" do
    log_in @user_1
    visit tasks_path
    expect(page).to have_text /.*test_task_03.*\n.*\ntest_task_01.*/
  end

  scenario "日時を入力する入力欄のテスト" do
    log_in @user_1
    visit new_task_path
    fill_in "task[name]",with:"name"
    fill_in "task[content]",with:"content"
    fill_in "task[deadline]",with:"12"
    click_button 'commit'
    expect(page).to have_content "name"
    expect(page).to have_content "content"
    expect(page).to have_content "12"
  end

  scenario "終了期限順に並べるテスト" do
    log_in @user_1
    visit tasks_path
    click_link '終了期限でソートする'
    expect(page).to have_text /.*2019-10-28.*\n.*\n.*2019-10-30.*/
  end

  scenario "名前、ステータス、優先度で絞り込みするためのテスト" do
    log_in @user_1
    visit tasks_path
    fill_in 'task_name',with: "task"
    select "未着手", from: 'task_status'
    select "低", from: 'task_priority'
    click_on 'search'
    expect(page).to have_text "未着手"
    expect(page).to have_text "低"
  end

  scenario "ラベルで絞り込むテスト" do
    log_in @user_1
    visit tasks_path
    visit new_task_path
    fill_in "task[name]",with:"name"
    fill_in "task[content]",with:"content"
    fill_in "task[deadline]",with:"12"
    check 'task_label_ids_15'
    click_on 'commit'
    check 'task_labels_ids_15'
    click_on 'search'
    expect(page).to have_text "work"
    save_and_open_page
  end
end
