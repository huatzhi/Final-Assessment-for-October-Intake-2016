require 'rails_helper'

RSpec.describe Ad, type: :model do
  describe 'Ad' do
    before do
      AdminUser.create!(username:'admin', email:'admin@huatzhi.com', password:'huatzhi', password_confirmation:'huatzhi')
      @admin_user = AdminUser.first
      @ad = Ad.create(title:"This is title",price:"2.22",location:'Johor',condition:'first_hand', contact_name:'Mr Huat', phone_number:'123446', email: 'email', description: 'alalallala', user_id: @admin_user.id)
    end
    
    it 'can be created' do
      expect(@ad).to be_valid
    end

    it 'cannot be created without title or price' do
      @ad.title = nil
      @ad.price = nil
      expect(@ad).to_not be_valid
    end
  end
end
