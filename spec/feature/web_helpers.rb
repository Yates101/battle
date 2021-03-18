def sign_in_and_play
  visit('/')
  fill_in :player_1, with: 'Taran'
  fill_in :player_2, with: 'Alec'
  click_button('Submit')
end