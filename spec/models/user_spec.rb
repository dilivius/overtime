require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'creation' do
    before do
      @user = User.create(email: 'john@snow.com',
                password: 'asdfasdf',password_confirmation: 'asdfasdf',
                first_name: 'John', last_name: 'Snow')
    end
    it 'can be created' do
      expect(@user).to be_valid
    end

    it 'cannot be created without first_name, last_name and email' do
      @user.first_name = nil
      @user.last_name = nil
      @user.email = nil

      expect(@user).to_not be_valid
    end
  end
end
