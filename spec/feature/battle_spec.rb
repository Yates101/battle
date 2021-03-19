require 'capybara/rspec'
require_relative '../../app'

feature '/play page' do
  scenario 'all elements of the battle page are displayed' do
    sign_in_and_play
    expect(page).to have_content('60/60 HP')
    expect(page).to have_button("Attack")
  end
end

feature 'game over' do
  scenario 'a players HP reaches 0' do
    sign_in_and_play
    play_out_game
    expect(page).to have_content("Alec loses, Taran is the winner!")
  end
end