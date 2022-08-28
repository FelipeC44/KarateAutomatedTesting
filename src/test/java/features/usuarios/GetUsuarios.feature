Feature: Metodo get para listar usuarios cadastrados

  Background:
    * url 'https://serverest.dev'

    @smoke
    Scenario: Listar todos os usuarios cadastrados
      Given path '/usuarios'
      When method Get
      Then status 200

    Scenario: Listar usuarios por nome
      Given path '/usuarios'
      And params 'nome = Fulano da Silva'
      When method Get
      Then status 200

    Scenario: Listar usuarios por nome e email
      Given path '/usuarios'
      And params {nome: 'Fulano da Silva', email: 'fulano@qa.com'}
      When method Get
      Then status 200

    Scenario: Listar usuarios por nome e email validar nome o do usuario retornado
      Given path '/usuarios'
      And params {nome: 'Fulano da Silva', email: 'fulano@qa.com'}
      When method Get
      Then status 200
      And match response.usuarios[0].nome == 'Fulano da Silva'

  Scenario: Listar usuarios e verificar se algum usuario e fulano da silva
    Given path '/usuarios'
    When method Get
    Then status 200
    And match response.usuarios[*].nome contains 'Fulano da Silva'

  Scenario: Listar usuarios por id apos cadastro
    Given path '/usuarios'
    And params {_id: 'sFhxoikSC5gwS8Sw'}
    When method Get
    Then status 200

  Scenario: Verificar o conteudo do response
    Given path '/usuarios'
    When method Get
    Then status 200
    And params response.quantidade != '#null'
    And params response.quantidade == '#number'