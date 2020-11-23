require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    context 'presence' do
      it { should validate_presence_of(:email) }
    end

    context 'email uniqueness' do
      before { create :user, email: 'test@mail.com' }
      let(:user) { build :user, email: 'test@mail.com' }
      it do
        user.valid?
        expect(user.errors[:email]).to include('has already been taken')
      end
    end

    context 'password truthness' do
      it 'has a truthy password' do
        user = create(:user)
        expect(user.valid_password?(user.password_confirmation)).to be_truthy
      end
    end
  end
end
