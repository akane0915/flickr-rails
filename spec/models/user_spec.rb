require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of :email }
  # it { should validate_uniqueness_of :email }
  it { should validate_presence_of :username }
  # it { should validate_uniqueness_of :username }


  it 'creates an admin account' do
    user = FactoryGirl.create(:admin)
    user.admin.should eq true
  end
end
