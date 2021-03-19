feature 'switch turns' do
  scenario 'player1''s turn first' do
    sign_in_and_play
    expect(page).to have_content "Taran's turn"
  end

  scenario 'after 1 attack, player2''s turn' do
    sign_in_and_play
    click_button("Attack")
    click_button("Continue")
    expect(page).to have_content "Alec's turn"
  end
end