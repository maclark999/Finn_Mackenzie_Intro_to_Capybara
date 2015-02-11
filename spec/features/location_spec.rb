require 'rails_helper'


describe 'User can CRUD locations' do

  scenario 'User can create a Location' do
    # visit root
    visit '/'

    # click on link to go to new location form
    click_on "New Location"

    #filling out form for location
    fill_in 'location[name]', :with => "building"
    fill_in 'location[address]', with: "New Address"
    fill_in 'location[zipcode]', with: "90210"

    #submitting form to create a location
    click_on "Create Location"


    #now we expect the index page to have the name of the location we created.
    expect(page).to have_content("building")
    # expecting the flash notification
    expect(page).to have_content("Location was successfully created")
  end

  scenario 'User can view a show page for a location' do
    #fill in
    visit '/'

    click_on "New Location"

    #filling out form for location
    fill_in 'location[name]', :with => "building"
    fill_in 'location[address]', with: "New Address"
    fill_in 'location[zipcode]', with: "90210"

    #submitting form to create a location
    click_on "Create Location"

    #submitting form to create a location
    click_on "building"

    expect(page).to have_content("New Address")
    expect(page).to have_content("90210")

  end

  scenario 'User can edit a location' do

    # visit root
    visit '/'

    # click on link to go to new location form
    click_on "New Location"

    #filling out form for location
    fill_in 'location[name]', :with => "building"
    fill_in 'location[address]', with: "New Address"
    fill_in 'location[zipcode]', with: "90210"

    #submitting form to create a location
    click_on "Create Location"
    click_on "Edit"

    fill_in 'location[name]', :with => "changed"
    click_on "Update Location"

    expect(page).to have_content("changed")
    expect(page).to have_content("Location was successfully updated")
    #fill in
  end


  scenario 'User can delete a location' do
    # visit root
    visit '/'

    # click on link to go to new location form
    click_on "New Location"

    #filling out form for location
    fill_in 'location[name]', :with => "building"
    fill_in 'location[address]', with: "New Address"
    fill_in 'location[zipcode]', with: "90210"

    #submitting form to create a location
    click_on "Create Location"
    click_on "Delete"

    #now we expect the index page to have the name of the location we created.
    expect(page).to have_no_content('building')
    # expecting the flash notification
    expect(page).to have_content("Location was successfully destroyed")

  end






end
