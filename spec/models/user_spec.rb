require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of :email }
  it { should validate_presence_of :username }
  it { should have_many :images }

  it 'creates an admin account' do
    user = FactoryGirl.create(:admin)
    user.admin.should eq true
  end
end
