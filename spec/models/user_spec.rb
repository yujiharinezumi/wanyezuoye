require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

    it "nameが空ならバリデーションが通らない" do
      user = User.new(name: '', email: 'a@gmail.com',password:"aaaaaa",password_confirmation:"aaaaaa")
      expect(user).not_to be_valid
    end


    it "emailが空ならバリデーションが通らない" do
      user = User.new(name: 'a', email: '',password:"aaaaaa",password_confirmation:"aaaaaa")
      expect(user).not_to be_valid
    end

    it "emailのフォーマットが違うならバリデーションが通らない" do
      user = User.new(name: 'a', email: 'a',password:"aaaaaa",password_confirmation:"aaaaaa")
      expect(user).not_to be_valid
    end

    it "同じemailが登録されているならバリデーションが通らない" do
      user1 = User.new(name: 'a', email: 'a@gmail.com',password:"aaaaaa",password_confirmation:"aaaaaa")
      user2 = User.new(name: 'b', email: 'a@gmail.com',password:"bbbbbb",password_confirmation:"bbbbbb")
      expect(user2).not_to be_valid
    end

    it "passwordが空ならバリデーションが通らない" do
      user = User.new(name: 'a', email: 'a@gmmail.com',password:"aaaaaa",password_confirmation:"")
      expect(user).not_to be_valid
    end

    it "passwordが6文字以内ならバリデーションが通らない" do
      user = User.new(name: 'a', email: 'a@gmmail.com',password:"1",password_confirmation:"1")
      expect(user).not_to be_valid
    end

    it "passwordがpassword_confirmatinと一致しないならバリデーションが通らない" do
      user = User.new(name: 'a', email: 'a@gmmail.com',password:"aaaaaa",password_confirmation:"bbbbbb")
      expect(user).not_to be_valid
    end
  end
