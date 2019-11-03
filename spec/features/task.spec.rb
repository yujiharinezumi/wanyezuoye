require 'rails_helper'

# このRSpec.featureの右側に、「タスク管理機能」のように、テスト項目の名称を書きます（do ~ endでグループ化されています）
RSpec.feature "タスク管理機能", type: :feature do
  # scenario（itのalias）の中に、確認したい各項目のテストの処理を書きます。
  background do
    # FactoryBot.create(:task)
    # FactoryBot.create(:second_task)
    @task1 = Task.create!(name: 'test_task_01', content: 'testtesttest',deadline:"2019/10/28",status: 0,priority: 0)
    @task2 = Task.create!(name: 'test_task_02', content: 'samplesample',deadline:"2019/10/29",status: 0,priority: 0)
    @task3 = Task.create!(name: 'test_task_03', content: 'samplesample',deadline:"2019/10/30",status: 0,priority: 0)
  end

  scenario "タスク一覧のテスト" do
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
   visit new_task_path

   # save_and_open_page

 # 「タスク名」というラベル名の入力欄と、「タスク詳細」というラベル名の入力欄に
 # タスクのタイトルと内容をそれぞれfill_in（入力）する
 # 2.ここに「タスク名」というラベル名の入力欄に内容をfill_in（入力）する処理を書く
  fill_in "Name",with: 'a'
 # 3.ここに「タスク詳細」というラベル名の入力欄に内容をfill_in（入力）する処理を書く
  fill_in "Content",with: 'a'
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
    visit task_path(@task1)
  #該当のタスクが表示されたページのデータが have_contentされているか期待するコードを記述する
    expect(page).to have_content 'test_task_01'
  end

  scenario "タスクが作成日時の降順に並んでいるかのテスト" do
    #indexのビューに遷移する
    visit tasks_path
    #orders変数の中にname,contentを配列の中に入れる
    orders = all('div td')
     # binding.pry
     # nameのidで絞りたいので、0,2,4の順番で指定する。
    expect(orders[0]).to have_content 'test_task_03'
    expect(orders[5]).to have_content 'test_task_02'
    expect(orders[10]).to have_content 'test_task_01'
  end

  scenario "日時を入力する入力欄のテスト" do

    visit new_task_path

    fill_in "Name",with:"name"
    fill_in "Content",with:"content"
    fill_in "Deadline",with:"12"

    click_button 'commit'

    expect(page).to have_content "name"
    expect(page).to have_content "content"
    expect(page).to have_content "12"
  end
end
