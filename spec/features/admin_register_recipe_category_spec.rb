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
    expect(current_path).to eq recipe_categories_path
    expect(page).to have_content 'Categoria de receita cadastrada com sucesso.'
    expect(page).to have_content 'Receitas de Natal'
  end

  scenario 'precisa preencher todos os campos' do
    #Arrange
    admin = User.create!(email: 'user@gmail.com', password: '123456', role: 'admin')

    #Act
    login_as admin
    visit root_path
    click_on 'Registrar categoria de receita'
    fill_in 'Nome', with: ''
    click_on 'Salvar'

    #Assert
    expect(page).to have_content 'Categoria de receita não cadastrada.'
    expect(page).not_to have_content 'Receitas de Natal'
  end

  scenario 'precisa ser admin' do
    user = User.create!(email: 'user@gmail.com', password: '123456', role: 'user')

    login_as user
    visit new_recipe_category_path

    expect(current_path).to eq root_path
  end

  scenario 'precisa estar logado' do
    #Act
    visit new_recipe_type_path

    #Assert
    expect(current_path).to eq new_user_session_path
  end
end