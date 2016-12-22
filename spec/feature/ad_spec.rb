require 'rails_helper'

describe 'navigate' do
  before do
    AdminUser.create!(username:'admin', email:'admin@huatzhi.com', password:'huatzhi', password_confirmation:'huatzhi')
    @admin_user = AdminUser.first
    page.set_rack_session(user_id: @admin_user.id)
    
  end

  describe 'index' do
    before do
      4.times do |number|
        Ad.create!(
          title:"#{number} title", 
          price: number, 
          location: rand(0..13), 
          condition: rand(0..1), 
          contact_name: "Mr. #{number}",
          phone_number: (number*rand(100000..999999)).to_s,
          email: "test@test.test",
          description: "The description of #{number}.",
          user_id: @admin_user.id
        )
      visit ads_path
      end
    end

    it 'show all ads' do
      expect(page).to have_content('1 title')
      expect(page).to have_content('2 title')
      expect(page).to have_content('3 title')
      expect(page).to have_content('0 title')
    end

    it 'create title as a link to show page' do
      click_on '1 title'
      expect(page.current_path).to eq ad_path(Ad.find_by_title('1 title').id)
    end
  end

  describe 'new' do
    before do
      visit new_ad_path
    end

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
    before do
      visit new_ad_path
    end

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