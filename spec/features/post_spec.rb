require 'rails_helper'

describe 'navigate' do
  let(:user) { FactoryGirl.create(:user)}
  let(:post) do
    Post.create(date: Date.today, work_performed: "work_performed", user_id: user.id, hours: 10.0)
  end

  before do
    login_as(user, scope: :user)
  end

  describe 'index' do
    before do
      visit posts_path
    end

    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'has a title of Posts' do
      #expect(page.title).to eq("Posts")
      expect(page).to have_content(/Posts/)
    end

    it 'has a list of posts' do
      newpost1 = FactoryGirl.create(:post)
      newpost2 = FactoryGirl.create(:second_post)
      # TO DO: FactoryGirl bug?
      newpost1.user_id = user.id
      newpost2.user_id = user.id
      newpost1.save
      newpost2.save
      # newpost1 = FactoryGirl.build_stubbed(:post)
      # newpost2 = FactoryGirl.build_stubbed(:second_post)
      visit posts_path

      expect(page).to have_content(/Post1|Post2/)
    end

    it 'has a scope that only post creators can see their posts' do
      # newpost1 = Post.create(date: Date.today, work_performed: "no rationale1", user_id: @user.id)
      # newpost2 = Post.create(date: Date.today, work_performed: "no rationale2", user_id: @user.id)
      #other_post = FactoryGirl.create(:post_from_other_user)
      other_user = User.create(email: 'test_other@test.com', password: 'asdfasdf',
                password_confirmation: 'asdfasdf', first_name: 'NonAuthorized', last_name: 'User',
                phone: '0328765348')
      other_post = Post.create(date: Date.yesterday, work_performed: "This should not be seen", user_id: other_user.id, hours: 4.0)

      visit posts_path
      expect(page).to_not have_content(/This should not be seen/)
    end
  end

  describe 'new' do
    it 'has a New Post link from the homepage' do
      employee = Employee.create(first_name: 'Employee', last_name: 'Authorized', email: "employee@example.com", password: "asdfasdf", password_confirmation: "asdfasdf", phone: "5555555555")
      login_as(employee, :scope => :user)
      visit root_path
      click_link 'new_post_from_nav'

      expect(page.status_code).to eq(200)
    end
  end

  describe 'delete' do
    it 'displays a delete button in the posts list' do
      logout(:user)
      delete_user = FactoryGirl.create(:user)
      login_as(delete_user, scope: :user)

      delete_post = Post.create(date: Date.today, work_performed: "asdf", user_id: delete_user.id, hours: 30.0)

      visit posts_path
      click_link "delete_#{delete_post.id}"

      expect(page.status_code).to eq(200)
    end
  end

  describe 'creation' do
    before do
      visit new_post_path
    end

    it 'has a New form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from New page' do
      fill_in  'post[date]', with: Date.today
      fill_in  'post[work_performed]', with: 'Some work_performed'
      fill_in  'post[hours]', with: 4.5

      expect{ click_on 'Save'}.to change(Post, :count).by(1)
    end

    it 'will have user associated with post' do
      fill_in  'post[date]', with: Date.today
      fill_in  'post[work_performed]', with: 'User Association'
      fill_in  'post[hours]', with: 4.5

      click_on 'Save'

      expect(User.last.posts.last.work_performed).to eq('User Association')
    end
  end

  describe 'edit post' do

    it 'can be edited' do
      login_as(user)
      visit edit_post_path(post)

      fill_in('post[date]', :with => Date.today)
      fill_in('post[work_performed]', :with => 'Edited content')

      expect(page).to have_content("Edited content")
    end

    it 'cannot be edited by a non-authorized user' do
      logout(:user)
      non_authorized_user = FactoryGirl.create(:non_authorized_user)
      login_as(non_authorized_user, scope: :user)

      visit(edit_post_path(post))

      expect(current_path).to eq(root_path)
    end
  end
end
