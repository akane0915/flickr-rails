require 'rails_helper'

feature "Sessions" do

  scenario "user can navigate to add an image page" do
    user = create(:user)
    sign_in user
    visit user_images_path(user)
    click_link "Add an Image"
    expect(page).to have_content("New Image")
  end

  scenario "displays error if picture file upload is missing" do
    user = create(:user)
    sign_in user
    image = build(:image)
    visit new_user_image_path(user)
    expect(page).to have_content("New Image")
    fill_in 'image_title', with: image.title
    click_button 'Create Image'
    expect(page).to have_content("Please fix these errors")
  end

  scenario "add an image" do
    user = create(:user)
    sign_in user
    image = build(:image)
    visit new_user_image_path(user)
    fill_in 'image_title', with: image.title
    attach_file "image_picture", "spec/photos/rails.png"
    click_button 'Create Image'
    expect(page).to have_content("test title")
  end


end
