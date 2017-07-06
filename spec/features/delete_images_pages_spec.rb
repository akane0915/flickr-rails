require 'rails_helper'

feature "Sessions" do

  scenario "user can navigate to edit an image page" do
    user = create(:user)
    sign_in user
    image = build(:image)
    visit user_images_path(user)
    click_on "rails"
    expect(page).to have_content("Delete")
  end
end
