def sign_in_and_play
  visit('/')
  fill_in :player_1, with: 'Taran'
  fill_in :player_2, with: 'Alec'
  click_button('Submit')
end

def play_out_game
  click_button('Attack')
  click_button('Continue')
  click_button('Attack')
  click_button('Continue')
  click_button('Attack')
  click_button('Continue')
  click_button('Attack')
  click_button('Continue')
  click_button('Attack')
  click_button('Continue')
  click_button('Attack')
  click_button('Continue')
  click_button('Attack')
  click_button('Continue')
  click_button('Attack')
  click_button('Continue')
  click_button('Attack')
  click_button('Continue')
  click_button('Attack')
  click_button('Continue')
  click_button('Attack')
  click_button('Continue')
end