Feature: Metodo delete para deletar usuarios

  Background:
    * url 'https://serverest.dev'

    Scenario: Deletar um usuario com sucesso
      * def id = call read('DeleteUsuario.feature@cadastrar')

      Given path '/usuarios/'+id.usuarioId
      When method Delete
      Then status 200
      And match response.message == "Registro excluído com sucesso"

    @ignore
    @cadastrar
    Scenario: Cadastrar para deletar

      * def now = function(){ return java.lang.System.currentTimeMillis() }
      * set body.email = 'teste'+now()+'@qa.com.br'
      * def body =
      """
      {
      "nome": "teste usuario",
      "email": "#(email)",
      "password": "teste",
      "administrador": "true"
      }
      """
      Given path '/usuarios'
      And request body
      When method Post
      Then status 201
      * def usuarioId = response._id