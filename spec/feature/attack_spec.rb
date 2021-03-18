feature 'Attacking' do
  scenario 'player 1 attacks player 2' do
    sign_in_and_play
    click_button "Attack"
    expect(page).to have_content "Taran attacked Alec!!!"
  end

  scenario 'players can attack eachother and receive confirmation' do
    sign_in_and_play
    click_button 'Attack'
    expect(page).to have_content('Taran attacked Alec!!!')
  end

  scenario 'attack reduces hitpoints' do
    sign_in_and_play
    expect(page).to have_content "60/60 HP"
    click_button "Attack"
    expect(page).to have_content "50/60 HP"
  end
end