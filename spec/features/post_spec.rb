require 'rails_helper'

describe 'navigate' do
  before do
    visit posts_path
  end

  describe 'index' do
    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'has a title of Posts' do
      #expect(page.title).to eq("Posts")
      expect(page).to have_content(/Posts/)
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
  end
end
