require 'rails_helper'

RSpec.describe Label, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  it "nameが空ならバリデーションが通らない" do
    label = Label.new(name: '')
    expect(label).not_to be_valid
  end
end
