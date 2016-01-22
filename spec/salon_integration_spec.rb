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
