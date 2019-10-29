require 'rails_helper'

RSpec.describe Task, type: :model do

  it "titleが空ならバリデーションが通らない" do
    task = Task.new(name: '', content: '失敗テスト')
    expect(task).not_to be_valid
  end

  it "contentが空ならバリデーションが通らない" do
    task = Task.new(name: '失敗テスト', content: '')
    expect(task).not_to be_valid
  end

  it "titleとcontentに内容が記載されていればバリデーションが通る" do
    task = Task.new(name: '', content: '')
    expect(task).not_to be_valid
  end
end
