require "rails_helper"

feature "User visits the route index" do
  let!(:route1) { FactoryGirl.create(:route, name: "Mushroom Cup") }
  let!(:route2) { FactoryGirl.create(:route, name: "Star Cup") }
  let!(:route3) { FactoryGirl.create(:route, name: "Special Cup") }

  scenario "User sees a list of all routes" do
    visit routes_path
    expect(page).to have_content(route1.name)
    expect(page).to have_content(route2.name)
    expect(page).to have_content(route3.name)
  end

  scenario "Clicking a train route should take the user to that routes page" do
    visit routes_path
    click_link route1.name
    expect(page).to have_content "Full schedule for the #{route1.name}"
  end
end
