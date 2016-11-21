require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Creation' do
    before do
      user = FactoryGirl.create(:user)
      login_as(user, scope: :user)
      @post = FactoryGirl.create(:post)
    end

    it 'can be created' do
      expect(@post).to be_valid
    end

    it 'cannot be created without a date, work_performed and overtime request' do
      @post.date = nil
      @post.work_performed = nil
      @post.hours = nil

      expect(@post).to_not be_valid
    end

    it 'has hours value greater than 0.0' do
      @post.hours = 0.0

      expect(@post).to_not be_valid
    end

  end
end
