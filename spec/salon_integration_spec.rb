require('capybara/rspec')
require('spec_helper')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new stylist', {:type => :feature}) do
  it('allows a user to add a new stylist') do
    visit('/')
    click_link('Stylists at Salon')
    fill_in('stylist', :with =>'Sherman Dog')
    click_button('Add New Stylist')
    expect(page).to have_content('Sherman Dog')
  end
end

describe('adding clients to a stylist', {:type => :feature}) do
  it('allows a user to add new clients to a particular stylist') do
    visit('/')
    click_link('Stylists at Salon')
    fill_in('stylist', :with =>'Sherman Dog')
    click_button('Add New Stylist')
    expect(page).to have_content('Sherman Dog')
    click_link('Sherman Dog')
    expect(page).to have_content("Sherman Dog doesn't appear to have any clients. Add some below!")
    fill_in('name', :with =>'Damien Cat')
    click_button('Add')
    expect(page).to have_content('Damien Cat')
  end
end

describe('deleting stylists from the salon', {:type => :feature}) do
  it('allows a user to delete stylists') do
    visit('/')
    click_link('Stylists at Salon')
    fill_in('stylist', :with =>'Sherman Dog')
    click_button('Add New Stylist')
    expect(page).to have_content('Sherman Dog')
    click_link('Sherman Dog')
    expect(page).to have_content('Remove Sherman Dog from the salon')
    click_button('Delete')
    expect(page).not_to(have_content('Sherman Dog'))
  end
end

describe('updating stylist names', {:type => :feature}) do
  it('allows a user to update a stylists name') do
    visit('/')
    click_link('Stylists at Salon')
    fill_in('stylist', :with =>'Sherman Dog')
    click_button('Add New Stylist')
    expect(page).to have_content('Sherman Dog')
    click_link('Sherman Dog')
    expect(page).to have_content('Update Stylist Info')
    fill_in('update_name', :with =>'Sherman the Dog')
    click_button('Update')
    expect(page).to have_content('Sherman the Dog')
  end
end

describe('view and update client info', {:type => :feature}) do
  it('allows a user to view and update a client name') do
    visit('/')
    click_link('Stylists at Salon')
    fill_in('stylist', :with =>'Sherman Dog')
    click_button('Add New Stylist')
    expect(page).to have_content('Sherman Dog')
    click_link('Sherman Dog')
    expect(page).to have_content("Sherman Dog doesn't appear to have any clients. Add some below!")
    fill_in('name', :with =>'Damien Cat')
    click_button('Add')
    expect(page).to have_content('Damien Cat')
    click_link('Damien Cat')
    expect(page).to have_content('Clients at Salon')
    click_link('Damien Cat')
    fill_in('update_client', :with =>'Damien the Cat')
    click_button('Update')
    expect(page).to have_content('Damien the Cat')
  end
end

describe('delete a client path', {:type => :feature}) do
  it('allows a user to delete a client') do
    visit('/')
    click_link('Stylists at Salon')
    fill_in('stylist', :with =>'Sherman Dog')
    click_button('Add New Stylist')
    expect(page).to have_content('Sherman Dog')
    click_link('Sherman Dog')
    expect(page).to have_content("Sherman Dog doesn't appear to have any clients. Add some below!")
    fill_in('name', :with =>'Damien Cat')
    click_button('Add')
    expect(page).to have_content('Damien Cat')
    click_link('Damien Cat')
    expect(page).to have_content('Clients at Salon')
    click_link('Damien Cat')
    fill_in('update_client', :with =>'Damien the Cat')
    click_button('Update')
    expect(page).to have_content('Damien the Cat')
    click_button('Delete')
    expect(page).not_to(have_content('Damien the Cat'))
  end
end
