# 「FactoryBotを使用します」という記述
FactoryBot.define do

  # 作成するテストデータの名前を「task」とします
  # （実際に存在するクラス名と一致するテストデータの名前をつければ、そのクラスのテストデータを自動で作成します）
  factory :task_first,class: Task do
    name { 'test_task_01' }
    content { 'testtesttest' }
    deadline {'2019/10/28'}
    status {'waiting'}
    priority {'medium'}
    user_id {User.first.id}

  end

  factory :task_second,class: Task do
    name { 'test_task_01' }
    name { 'test_task_02' }
    content { 'samplesample' }
    deadline {'2019/10/29'}
    status {'completed'}
    priority {'medium'}
    user_id {User.second.id}
  end

  factory :task_third,class: Task do
    name { 'test_task_01' }
    name { 'test_task_03' }
    content { 'samplesample' }
    deadline {'2019/10/30'}
    status {'waiting'}
    priority {'medium'}
    user_id {User.third.id}
  end


  # 作成するテストデータの名前を「second_task」とします
  # （存在しないクラス名の名前をつける場合、オプションで「このクラスのテストデータにしてください」と指定します）
end
