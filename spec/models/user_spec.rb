require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.create(email: 'john@snow.com',
              password: 'asdfasdf',password_confirmation: 'asdfasdf',
              first_name: 'John', last_name: 'Snow', phone: '0123423890',
              ssn: 1234, company: 'IT')
  end

  describe 'creation' do
    it 'can be created' do
      expect(@user).to be_valid
    end
  end

  describe 'validations' do
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
    it 'it requires the phone attr to contain only integers' do
      @user.phone = 'mygreatstr'

      expect(@user).to_not be_valid
    end
    it 'it requires the phone attr to only have 10 chars' do
      @user.phone = '01234567676770'

      expect(@user).to_not be_valid
    end
    it 'it requires an ssn attr' do
      @user.ssn = nil

      expect(@user).to_not be_valid
    end
    it 'it requires a company' do
      @user.company = nil

      expect(@user).to_not be_valid
    end
    it 'it requires the ssn attr to contain only integers' do
      @user.ssn = 'mygreatstr'

      expect(@user).to_not be_valid
    end
    it 'it requires the ssn attr to only have 4 chars' do
      @user.ssn = '12345'

      expect(@user).to_not be_valid
    end
  end

  describe 'custom name methods' do
    it 'has a full_name method that combines first and last names' do
      expect(@user.full_name).to eq("Snow, John")
    end
  end

  describe 'relationship between admins and employees' do
    it 'allows for admins to be associated with multiple employees' do
      employee_1 = FactoryGirl.create(:user)
      employee_2 = FactoryGirl.create(:user)
      admin = FactoryGirl.create(:admin_user)

      Member.create!(user_id: admin.id, member_id: employee_1.id)
      Member.create!(user_id: admin.id, member_id: employee_2.id)

      expect(admin.members.count).to eq(2)
    end
  end
end
