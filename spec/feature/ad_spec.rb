require 'rails_helper'

describe 'navigate' do
  before do
    AdminUser.create!(username:'admin', email:'admin@huatzhi.com', password:'huatzhi', password_confirmation:'huatzhi')
    @admin_user = AdminUser.first
    page.set_rack_session(user_id: @admin_user.id)
    visit new_ad_path
  end

  describe 'index' do
    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'cannot be reach when user is not login' do
      page.set_rack_session(user_id: nil)
      visit new_ad_path
      expect(page.current_path).to eq log_in_path
    end
  end

  describe 'creation' do
    it 'has a new form that can be reach' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from new form page' do
      fill_in 'ad[title]', with: 'Ads Title'
      fill_in 'ad[price]', with: '2.22'
      select "N. Sembilan", from: 'ad[location]'
      choose 'ad_condition_second_hand'
      fill_in 'ad[contact_name]', with: 'Huat'
      fill_in 'ad[phone_number]', with: '02220788231'
      fill_in 'ad[email]', with: 'tom@tom.tom'

      click_on "Post Ad!"

      expect(page).to have_content('Ads Title')
      expect Ad.last.user_id = @admin_user.id
    end

    it 'cannot be reach when user is not login' do
      page.set_rack_session(user_id: nil)
      visit new_ad_path
      expect(page.current_path).to eq log_in_path
    end
  end
end