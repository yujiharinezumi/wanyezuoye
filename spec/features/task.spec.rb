require 'rails_helper'
require 'support/utilities'

# このRSpec.featureの右側に、「タスク管理機能」のように、テスト項目の名称を書きます（do ~ endでグループ化されています）
RSpec.feature "タスク管理機能", type: :feature do
  background do
    # FactoryBot.create(:task_first, user_id: user_first.id)
    # FactoryBot.create(:task_first, user_id: FactoryBot.create(:user_first).id)
    # @user = Task.first.user
    # FactoryBot.create(:task_second, user_id: user_second.id )
    # FactoryBot.create(:task_third, user_id: user_third.id )
    @user_1 = FactoryBot.create(:user_first)
    @user_2 = FactoryBot.create(:user_second)
    @label_1 = FactoryBot.create(:label_first)
    @label_2 = FactoryBot.create(:label_second)
    @task1 = FactoryBot.create(:task_first, user_id: @user_1.id)
    @task3 = FactoryBot.create(:task_third, user_id: @user_1.id)
    @task2 = FactoryBot.create(:task_second, user_id: @user_2.id)
    # @task2 = FactoryBot.create(:task_second)
    # @task3 = FactoryBot.create(:task_third)
  end

  scenario "タスク一覧のテスト" do
    # @user_0 = User.create(name: "sugasuga")
    log_in @user_1
    # tasks_pathにvisitする（タスク一覧ページに遷移する）
    visit tasks_path

    # visitした（到着した）expect(page)に（タスク一覧ページに）「testtesttest」「samplesample」という文字列が
    # have_contentされているか？（含まれているか？）ということをexpectする（確認・期待する）テストを書いている
    expect(page).to have_content 'testtesttest'
    expect(page).to have_content 'samplesample'
    expect(page).to have_content 'samplesample'
  end

  scenario "タスク作成のテスト" do
 # new_task_pathにvisitする（タスク登録ページに遷移する）
 # 1.ここにnew_task_pathにvisitする処理を書く
   log_in @user_1
   visit new_task_path

   # save_and_open_page

 # 「タスク名」というラベル名の入力欄と、「タスク詳細」というラベル名の入力欄に
 # タスクのタイトルと内容をそれぞれfill_in（入力）する
 # 2.ここに「タスク名」というラベル名の入力欄に内容をfill_in（入力）する処理を書く
  fill_in "task[name]",with: 'a'
 # 3.ここに「タスク詳細」というラベル名の入力欄に内容をfill_in（入力）する処理を書く
  fill_in "task[content]",with: 'a'
 # 「登録する」というvalue（表記文字）のあるボタンをclick_onする（クリックする）
 # 4.「登録する」というvalue（表記文字）のあるボタンをclick_onする（クリックする）する処理を書く
  click_button 'commit'
 # clickで登録されたはずの情報が、タスク詳細ページに表示されているかを確認する
 # （タスクが登録されたらタスク詳細画面に遷移されるという前提）
 # 5.タスク詳細ページに、テストコードで作成したはずのデータ（記述）がhave_contentされているか（含まれているか）を確認（期待）するコードを書く
  expect(page).to have_content 'a'
  expect(page).to have_content 'a'
  end

  scenario "タスク詳細のテスト" do
  #task1,2の変数を用意しTaskをインスタンス化します。
  #taskの詳細に戦死するように　visitに遷移するようにさせる
    log_in @user_1
    visit task_path(@task1)
  #該当のタスクが表示されたページのデータが have_contentされているか期待するコードを記述する
    expect(page).to have_content 'test_task_01'
  end

  scenario "タスクが作成日時の降順に並んでいるかのテスト" do
    #indexのビューに遷移する
    log_in @user_1
    visit tasks_path
    #orders変数の中にname,contentを配列の中に入れる
    # orders = all('div td')
    # binding.pry
     # binding.pry
     # nameのidで絞りたいので、0,2,4の順番で指定する。
    # expect(orders[]).to have_content 'test_task_03'
    # expect(orders).to have_content 'test_task_02'
    # expect(orders[]).to have_content 'test_task_01'
    # sleep(3)
    expect(page).to have_text /.*test_task_03.*\n.*\ntest_task_01.*/
    # expect(page).to have_text /.*未着手.*高.*/
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
    # save_and_open_page
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

    save_and_open_page
  end

  # scenario "ラベルで絞り込むテスト" do
  #   log_in @user_1
  #   visit tasks_path
  #   visit new_task_path
  #   fill_in "task[name]",with:"name"
  #   fill_in "task[content]",with:"content"
  #   fill_in "task[deadline]",with:"12"
  #   # select "", from: 'task_status'
  #   # select "", from: 'task_priority'
  #   check 'task_label_ids_15'
  #   click_on 'commit'
  #   click_on 'search'
  #   save_and_open_page
  #
  #
  #
  #
  #
  #
  # end
end
