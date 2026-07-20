*** Settings ***
Library        Browser

Documentation        Cenários de testes de pré-cadastro de clientes

Resource        ../resources/base.resource


*** Test Cases ***

Deve iniciar o cadastro do cliente

    #
    ${account}    Get Fake Account
    # preparação

    #(abre o naveador no endereço)
    Start session
    Submit signup form        ${account}

    #verificação
    Wait for Elements State
    ...    text=Faça seu cadastro e venha para a Smartbit!    
    ...    visible    5

    Sleep    5

Campo nome deve ser obrigatório
    #para executar somente o cenário que eu quero usamos
    #tags e o comando (robot -d ./logs -i required tests/signup.robot )
    [Tags]    required

    ${account}    Create Dictionary
    ...    name=${EMPTY}
    ...    email=leonardo@hot.com
    ...    cpf=86918027077

    Start session
    Submit signup form        ${account}
    Notice should be         Por favor informe o seu nome completo  
    
    Sleep    5

Campo email deve ser obrigatório
    #para executar somente o cenário que eu quero usamos
    #tags e o comando (robot -d ./logs -i required tests/signup.robot )
    [Tags]    required

     ${account}    Create Dictionary
    ...    name=Leonardo
    ...    email=${EMPTY}
    ...    cpf=86918027077

    Start session
    Submit signup form        ${account}
    Notice should be         Por favor, informe o seu melhor e-mail  
    
    Sleep    5

Campo cpf deve ser obrigatório
    #para executar somente o cenário que eu quero usamos
    #tags e o comando (robot -d ./logs -i required tests/signup.robot )
    [Tags]    required

     ${account}    Create Dictionary
    ...    name=Leonardo
    ...    email=leonardo@hot.com
    ...    cpf=${EMPTY}

    Start session
    Submit signup form        ${account}
    Notice should be          Por favor, informe o seu CPF  
    
    Sleep    5

Email no formato invalido
    #para executar somente o cenário que eu quero usamos
    #tags e o comando (robot -d ./logs -i required tests/signup.robot )
    [Tags]    inv

     ${account}    Create Dictionary
    ...    name=Leonardo
    ...    email=leonardo*hot.com
    ...    cpf=86918027077

    #(abre o naveador no endereço)
    Start session
    Submit signup form        ${account}
    Notice should be         Oops! O email informado é inválido

    #valida texto de cadastro
    Get Text             css=#signup h2
    ...        equal    
    ...    Faça seu cadastro e venha para a Smartbit!
    
 
    
    Sleep    5    

CPF no formato invalido
    #para executar somente o cenário que eu quero usamos
    #tags e o comando (robot -d ./logs -i required tests/signup.robot )
    [Tags]    inv

     ${account}    Create Dictionary
    ...    name=Leonardo
    ...    email=leonardo@hot.com
    ...    cpf=86918027000

    #(abre o naveador no endereço)
    Start session
    Submit signup form        ${account}
    Notice should be        Oops! O CPF informado é inválido  
    
    Sleep    5

*** Keywords ***

Start session
    #(abre o naveador no endereço)
    New Browser    browser=chromium    headless=False
    New Page        http://localhost:3000



Submit Signup form
    [Arguments]    ${account}

    #valida texto de cadastro
    Get Text             css=#signup h2
    ...        equal    
    ...    Faça seu cadastro e venha para a Smartbit!
    
    #ato
    #realiza os imputs nos campos

    Fill Text            id =name        ${account}[name]
    Fill Text            id =email       ${account}[email]
    Fill Text            id =cpf         ${account}[cpf]
    
    #clica no sumimit (cadastrar)
    Click                css=button >> text=Cadastrar

Notice should be
    [Arguments]    ${target}

    ${element}    Set Variable    css=form .notice
    Wait for Elements State    
    ...    ${element}    
    ...    visible    5
    Get Text    ${element}    equal  ${target}