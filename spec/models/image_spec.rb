require 'rails_helper'

describe Image do
  it { should validate_presence_of :title }
  it { should validate_presence_of :picture }
  it { should belong_to :user }

  it { should have_attached_file(:picture) }
  it { should validate_attachment_presence(:picture) }
  it { should validate_attachment_content_type(:picture).
    allowing("image/png", "image/gif").
    rejecting("text/plain", "text/xml") }

  it 'creates an image' do
    image = FactoryGirl.create(:image)
    user.image.title.should eq "test title"
  end

end
