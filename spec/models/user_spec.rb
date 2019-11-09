require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

    it "nameが空ならバリデーションが通らない" do
      user = User.new(name: '', email: 'a@gmail.com',password_digest:"aaaaaa")
      expect(user).not_to be_valid
    end


    it "emailが空ならバリデーションが通らない" do
      user = User.new(name: 'a', email: '',password_digest:"aaaaaa")
      expect(user).not_to be_valid
    end

    it "emailのフォーマットが違うならバリデーションが通らない" do
      user = User.new(name: 'a', email: 'a',password_digest:"aaaaaa")
      expect(user).not_to be_valid
    end

    it "同じemailが登録されているならバリデーションが通らない" do
      user1 = User.new(name: 'a', email: 'a@gmail.com',password_digest:"aaaaaa")
      user2 = User.new(name: 'a', email: 'b@gmail.com',password_digest:"bbbbbb")
      expect(user2).not_to be_valid
    end

    it "passwordが空ならバリデーションが通らない" do
      user = User.new(name: 'a', email: 'a@gmmail.com',password_digest:"")
      expect(user).not_to be_valid
    end

    it "passwordが6文字以内ならバリデーションが通らない" do
      user = User.new(name: 'a', email: 'a@gmmail.com',password_digest:"aaa")
      expect(user).not_to be_valid
    end

    it "passwordがpassword_confirmatinと一致しないならバリデーションが通らない" do
      user = User.new(name: 'a', email: 'a@gmmail.com',password:"aaaaaa",password_confirmation:"bbbbbb")
      expect(user).not_to be_valid
    end
  end
