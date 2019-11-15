# 「FactoryBotを使用します」という記述
FactoryBot.define do
  factory :task_first,class: Task do
    name { 'test_task_01' }
    content { 'testtesttest' }
    deadline {'2019/10/28'}
    status {'waiting'}
    priority {'low'}
  end

  factory :task_second,class: Task do
    name { 'test_task_02' }
    content { 'samplesample' }
    deadline {'2019/10/29'}
    status {'completed'}
    priority {'medium'}
  end

  factory :task_third,class: Task do
    name { 'test_task_03' }
    content { 'samplesample' }
    deadline {'2019/10/30'}
    status {'waiting'}
    priority {'heigh'}
  end
end
