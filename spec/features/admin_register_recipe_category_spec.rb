require 'rails_helper'

feature 'Admin registra categoria de receita' do
  scenario 'com sucesso' do
    #Arrange
    admin = User.create!(email: 'user@gmail.com', password: '123456', role: 'admin')

    #Act
    login_as admin
    visit root_path
    click_on 'Registrar categoria de receita'
    fill_in 'Nome', with: 'Receitas de Natal'
    click_on 'Salvar'

    #Assert
    expect(page).to have_content 'Categoria de receita cadastrada com sucesso.'
    expect(page).to have_content 'Receitas de Natal'
  end
end