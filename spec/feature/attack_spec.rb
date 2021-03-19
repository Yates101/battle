feature 'Attacking' do
  scenario 'players can attack eachother and receive confirmation' do
    sign_in_and_play
    click_button 'Attack'
    expect(page).to have_content('Taran attacked Alec!!!')
  end

  scenario 'attack reduces hitpoints' do
    sign_in_and_play
    expect(page).to have_content "60/60 HP"
    click_button "Attack"
    click_button "Continue"
    expect(page).to have_content "50/60 HP"
  end
end