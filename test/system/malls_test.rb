require "application_system_test_case"

class MallsTest < ApplicationSystemTestCase
  setup do
    @mall = malls(:one)
  end

  test "visiting the index" do
    visit malls_url
    assert_selector "h1", text: "Malls"
  end

  test "creating a Mall" do
    visit malls_url
    click_on "New Mall"

    fill_in "City", with: @mall.city
    fill_in "Lat", with: @mall.lat
    fill_in "Lng", with: @mall.lng
    fill_in "Name", with: @mall.name
    click_on "Create Mall"

    assert_text "Mall was successfully created"
    click_on "Back"
  end

  test "updating a Mall" do
    visit malls_url
    click_on "Edit", match: :first

    fill_in "City", with: @mall.city
    fill_in "Lat", with: @mall.lat
    fill_in "Lng", with: @mall.lng
    fill_in "Name", with: @mall.name
    click_on "Update Mall"

    assert_text "Mall was successfully updated"
    click_on "Back"
  end

  test "destroying a Mall" do
    visit malls_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mall was successfully destroyed"
  end
end
