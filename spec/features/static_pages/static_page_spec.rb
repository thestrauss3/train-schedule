require "rails_helper"

feature "User navigates the website" do
  feature "User visits the root path" do
    scenario "User should see the home page" do
      visit root_path
      expect(page).to have_content "Welcome to Train Spotter"
    end
    scenario "User should see a link to the Boston Transportation Portal" do
      visit root_path
      expect(page).to have_content "Boston"
      click_link "Boston"
      expect(page).to have_content "An organized view of Boston"
    end
  end
end
