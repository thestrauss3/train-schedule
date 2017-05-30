require "rails_helper"

feature "User visits the route index" do
  let!(:line1) { FactoryGirl.create(:route, name: "Mushroom Cup") }
  let!(:line2) { FactoryGirl.create(:route, name: "Star Cup") }
  let!(:line3) { FactoryGirl.create(:route, name: "Special Cup") }

  scenario "User sees a list of all train lines" do
    visit routes_path
    expect(page).to have_content(line1.name)
    expect(page).to have_content(line2.name)
    expect(page).to have_content(line3.name)
  end

  scenario "Clicking a train line should take the user to that lines page" do
    visit routes_path
    click_link line1.name
    expect(page).to have_content "Full schedule for the #{line1.name}"
  end
end
