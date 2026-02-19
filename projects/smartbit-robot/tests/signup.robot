*** Settings ***
Library        Browser
Documentation        Cenários de testes de pré-cadastro de clientes


*** Test Cases ***

Deve iniciar o cadastro do cliente

    # preparação
    #(abre o naveador no endereço)
    New Browser    browser=chromium    headless=False
    New Page        http://localhost:3000

    #valida texto de cadastro
    Get Text             css=#signup h2    equal    Faça seu cadastro e venha para a Smartbit!
    
    #ato
    #realiza os imputs nos campos

    Fill Text            id =name        Leonardo Euzebio
    Fill Text            id =email       diverleo@hotmail.com
    Fill Text            id =document    23846387851
    
    #clica no sumimit (cadastrar)
    Click                css=button >> text=Cadastrar
    #Click        xpath=//button[text()="Cadastrar"]

    #verificação
    Wait for Elements State    text=Falta pouco para fazer parte da família Smartbit!    visible    5

    Sleep    5