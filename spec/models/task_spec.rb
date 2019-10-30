require 'rails_helper'

RSpec.describe Task, type: :model do

  it "titleが空ならバリデーションが通らない" do
    task = Task.new(name: '', content: '失敗テスト',deadline:"12")
    expect(task).not_to be_valid
  end

  it "contentが空ならバリデーションが通らない" do
    task = Task.new(name: '失敗テスト', content: '',deadline:"12")
    expect(task).not_to be_valid
  end


  it "deadlineが空ならバリデーションが通らない" do
    task = Task.new(name: '失敗テスト', content: '失敗テスト', deadline:'')
    expect(task).not_to be_valid
  end

  it "titleとcontentに内容が記載されていればバリデーションが通る" do
    task = Task.new(name: '', content: '',deadline:'')
    expect(task).not_to be_valid
  end
end
