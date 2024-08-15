require 'rails_helper'

feature "user can search for members" do
  scenario "user submits valid state name" do
    visit '/'

    select "Colorado", from: :state
    save_and_open_page
    click_on "Locate Representatives"

    expect(current_path).to eq(search_path)

    within (first(".member")) do
      expect(page).to have_css(".name")
      expect(page).to have_css(".party")
      expect(page).to have_css(".state")
    end
  end
end