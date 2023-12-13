require 'rails_helper'

feature 'detalhes de uma receita' do
  scenario 'GET/api/v1/recipe.id' do
    #Arrange
    admin = User.create!(email: 'admin@gmail.com', password: '123456', role: 'admin')
    user = User.create!(email: 'user@gmail.com', password: '123456', role: 'user')
    recipe_type = RecipeType.create!(name: 'Sobremesa')
    recipe_category = RecipeCategory.create!(name: 'Receitas da Vovó', user: admin)
    recipe = Recipe.create!(title: 'Bolo de Cenoura', cook_time: 50, ingredients: 'Farinha, ovos', 
                            instructions: 'Misturar os ingredientes e levar ao forno', recipe_type: recipe_type,
                            user: user)

    #Act
    get "/api/v1/#{recipe.id}"

    #Assert
    expect(responde.status).to eq 200
    expect(response.content_type).to include 'application/json'
    json_response = JSON.parse(response.body)
    expect(json_response.length).to eq 1
    expect(json_response.keys).to include 'title'
  end
end