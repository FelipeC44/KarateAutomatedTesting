Feature: Metodo post para cadastrar usuarios

  Background:
    * url url

    Scenario: Cadastrar usuario com sucesso com body no corpo do teste

      * def body =
      """
      {
      "nome": "Felipe Cardoso",
      "email": "felipeC@qa.com.br",
      "password": "teste",
      "administrador": "true"
      }
      """
      Given path '/usuarios'
      And request body
      When method Post
      Then status 201
      And match response.message == "Cadastro realizado com sucesso"

      Scenario: Cadastrar usuario com sucesso com body em arquivo json
        * def now = function(){ return java.lang.System.currentTimeMillis() }

        * def body = read('classpath:/jsons/usuarios.json')
        * set body.nome = 'julia'
        * set body.email = 'julia'+now()+'@qa.com.br'
        * set body.password = '123456'
        * set body.administrador = 'false'

        Given path '/usuarios'
        And request body
        When method Post
        Then status 201
        And match response.message == "Cadastro realizado com sucesso"