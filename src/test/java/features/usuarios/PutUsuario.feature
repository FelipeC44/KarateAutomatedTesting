Feature: Método put para editar usuarios

  Background:
    * url 'https://serverest.dev'

    Scenario: Alterar um usuario com socesso

      * def body =
      """
      {
      "nome": "Felipe Cardoso",
      "email": "felipeC@qa.com.br",
      "password": "teste",
      "administrador": "true"
      }

      """

      Given path '/usuarios/OjqsVRHxspcA0Gpg'
      And request body
      When method put
      Then status 200
      And match response.message == "Registro alterado com sucesso"