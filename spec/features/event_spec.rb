require 'rails_helper'

describe 'User can CRUD events' do
  before :each do
    @my_location = Location.create(name: 'Fancy Place')
  end
  scenario 'User can create an event' do
    visit "/locations/#{@my_location.id}"
    click_on "New Event"

      fill_in 'event[description]', :with => 'birthday'
      fill_in 'event[date]', :with => '01/01/2015'
      check ('event[requires_id]')

    click_on 'Create Event'

    expect(page).to have_content('birthday')
  end
  scenario 'User can view a show page for an event' do
      visit "/locations/#{@my_location.id}"
      click_on "New Event"

        fill_in 'event[description]', :with => 'birthday'
        fill_in 'event[date]', :with => '01/01/2015'
        check ('event[requires_id]')

      click_on 'Create Event'
      click_on 'birthday'

      expect(page).to have_content('birthday')
      expect(page).to have_content('2015-01-01')
  end
  scenario 'User can edit an event' do
    visit "/locations/#{@my_location.id}"
    click_on "New Event"

      fill_in 'event[description]', :with => 'birthday'
      fill_in 'event[date]', :with => '01/01/2015'
      check ('event[requires_id]')

      click_on 'Create Event'
      click_on 'Edit'

      fill_in 'event[description]', :with => '27st birthday'

      click_on 'Update Event'

      expect(page).to have_content('27st birthday')

  end
  scenario 'User can delete an event' do
    visit "/locations/#{@my_location.id}"
    click_on "New Event"

      fill_in 'event[description]', :with => 'birthday'
      fill_in 'event[date]', :with => '01/01/2015'
      check ('event[requires_id]')

      click_on 'Create Event'
      click_on 'Delete'

      expect(page).to have_content('Event was successfully destroyed')
      expect(page).to have_no_content('birthday')
  end
end
