require 'rails_helper'

describe 'navigate' do
  before do
    @user = FactoryGirl.create(:user)
    login_as(@user, scope: :user)
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
      # newpost1 = FactoryGirl.build_stubbed(:post)
      # newpost2 = FactoryGirl.build_stubbed(:second_post)
      visit posts_path

      expect(page).to have_content(/Post1|Post2/)
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
      fill_in  'post[rationale]', with: 'Some rationale'
      click_on 'Save'

      expect(page).to have_content("Some rationale")
    end

    it 'will have user associated with post' do
      fill_in  'post[date]', with: Date.today
      fill_in  'post[rationale]', with: 'User Association'
      click_on 'Save'

      expect(User.last.posts.last.rationale).to eq('User Association')
    end
  end

  describe 'edit post' do
    before do
      @post = FactoryGirl.create(:post)
    end
    it 'can be reached by clcking Edit from the index page' do
      visit posts_path
      click_link("edit_#{@post.id}")

      expect(page.status_code).to eq(200)
    end

    it 'can be edited' do
      visit edit_post_path(@post)

      fill_in('post[date]', :with => Date.today)
      fill_in('post[rationale]', :with => 'Edited content')

      expect(page).to have_content("Edited content")
    end
  end
end
