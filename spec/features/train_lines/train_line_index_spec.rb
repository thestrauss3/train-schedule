require "rails_helper"

feature "User visits the train_line index" do
  let!(:line1) { FactoryGirl.create(:train_line, name: "Mushroom Cup") }
  let!(:line2) { FactoryGirl.create(:train_line, name: "Star Cup") }
  let!(:line3) { FactoryGirl.create(:train_line, name: "Special Cup") }

  scenario "User sees a list of all train lines" do
    visit train_lines_path
    expect(page).to have_content("Mushroom Cup")
    expect(page).to have_content("Star Cup")
    expect(page).to have_content("Special Cup")
  end
end