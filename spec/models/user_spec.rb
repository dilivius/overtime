require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.create(email: 'john@snow.com',
              password: 'asdfasdf',password_confirmation: 'asdfasdf',
              first_name: 'John', last_name: 'Snow', phone: '01234238')
  end

  describe 'creation' do
    it 'can be created' do
      expect(@user).to be_valid
    end

    it 'cannot be created without first_name' do
      @user.first_name = nil

      expect(@user).to_not be_valid
    end
    it 'cannot be created without last_name' do
      @user.last_name = nil

      expect(@user).to_not be_valid
    end
    it 'cannot be created without email' do
      @user.email = nil

      expect(@user).to_not be_valid
    end
    it 'cannot be created without phone' do
      @user.phone = nil

      expect(@user).to_not be_valid
    end
  end

  describe 'custom name methods' do
    it 'has a full_name method that combines first and last names' do
      expect(@user.full_name).to eq("Snow, John")
    end
  end
end
