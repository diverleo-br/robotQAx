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
    New Browser    browser=chromium    headless=False
    New Page        http://localhost:3000


    #valida texto de cadastro
    Get Text             css=#signup h2
    ...        equal    
    ...    Faça seu cadastro e venha para a Smartbit!
    
    #ato
    #realiza os imputs nos campos

    Fill Text            id =name        ${account}[name]
    Fill Text            id =email       ${account}[email]
    Fill Text            id =document    ${account}[document]
    
    #clica no sumimit (cadastrar)
    Click                css=button >> text=Cadastrar
    #Click        xpath=//button[text()="Cadastrar"]

    #verificação
    Wait for Elements State    
    ...    text=Falta pouco para fazer parte da família Smartbit!    
    ...    visible    5

    Sleep    5


Campo nome deve ser obrigatório
    #para executar somente o cenário que eu quero usamos
    #tags e o comando (robot -d ./logs -i required tests/signup.robot )
    [Tags]    required

    #(abre o naveador no endereço)
    New Browser    browser=chromium    headless=False
    New Page        http://localhost:3000


    #valida texto de cadastro
    Get Text             css=#signup h2
    ...        equal    
    ...    Faça seu cadastro e venha para a Smartbit!
    
    #ato
    #realiza os imputs nos campos

    Fill Text            id =email       leonardo*hot.com
    Fill Text            id =document    86918027077
    #clica no sumimit (cadastrar)
    Click                css=button >> text=Cadastrar
    #Click        xpath=//button[text()="Cadastrar"]

    #verificação da caixa de (notice) mostrando alertas dinamicos aqui usamos css 
    Wait for Elements State    
    ...    css=form .notice    
    ...    visible    5
    Get Text    css=form .notice    equal  Por favor informe o seu nome completo  
    
    Sleep    5

Campo email deve ser obrigatório
    #para executar somente o cenário que eu quero usamos
    #tags e o comando (robot -d ./logs -i required tests/signup.robot )
    [Tags]    required

    #(abre o naveador no endereço)
    New Browser    browser=chromium    headless=False
    New Page        http://localhost:3000


    #valida texto de cadastro
    Get Text             css=#signup h2
    ...        equal    
    ...    Faça seu cadastro e venha para a Smartbit!
    
    #ato
    #realiza os imputs nos campos

    Fill Text            id =name        Leonardo
    Fill Text            id =document    86918027077
    #clica no sumimit (cadastrar)
    Click                css=button >> text=Cadastrar
    #Click        xpath=//button[text()="Cadastrar"]

    #verificação da caixa de (notice) mostrando alertas dinamicos aqui usamos css 
    Wait for Elements State    
    ...    css=form .notice    
    ...    visible    5
    Get Text    css=form .notice    equal  Por favor, informe o seu melhor e-mail  
    
    Sleep    5

Campo cpf deve ser obrigatório
    #para executar somente o cenário que eu quero usamos
    #tags e o comando (robot -d ./logs -i required tests/signup.robot )
    [Tags]    required

    #(abre o naveador no endereço)
    New Browser    browser=chromium    headless=False
    New Page        http://localhost:3000


    #valida texto de cadastro
    Get Text             css=#signup h2
    ...        equal    
    ...    Faça seu cadastro e venha para a Smartbit!
    
    #ato
    #realiza os imputs nos campos

    Fill Text            id =name        Leonardo
    Fill Text            id =email       leonardo@hot.com
    #clica no sumimit (cadastrar)
    Click                css=button >> text=Cadastrar
    #Click        xpath=//button[text()="Cadastrar"]

    #verificação da caixa de (notice) mostrando alertas dinamicos aqui usamos css 
    Wait for Elements State    
    ...    css=form .notice    
    ...    visible    5
    Get Text    css=form .notice    equal  Por favor, informe o seu CPF  
    
    Sleep    5

Email no formato invalido
    #para executar somente o cenário que eu quero usamos
    #tags e o comando (robot -d ./logs -i required tests/signup.robot )
    [Tags]    inv

    #(abre o naveador no endereço)
    New Browser    browser=chromium    headless=False
    New Page        http://localhost:3000


    #valida texto de cadastro
    Get Text             css=#signup h2
    ...        equal    
    ...    Faça seu cadastro e venha para a Smartbit!
    
    #ato
    #realiza os imputs nos campos

    Fill Text            id =name        Leonardo
    Fill Text            id =email       leonardo*hot.com
    Fill Text            id =document    86918027077
    #clica no sumimit (cadastrar)
    Click                css=button >> text=Cadastrar
    #Click        xpath=//button[text()="Cadastrar"]

    #verificação da caixa de (notice) mostrando alertas dinamicos aqui usamos css 
    Wait for Elements State    
    ...    css=form .notice    
    ...    visible    5
    Get Text    css=form .notice    equal  Oops! O email informado é inválido  
    
    Sleep    5    

CPF no formato invalido
    #para executar somente o cenário que eu quero usamos
    #tags e o comando (robot -d ./logs -i required tests/signup.robot )
    [Tags]    inv

    #(abre o naveador no endereço)
    New Browser    browser=chromium    headless=False
    New Page        http://localhost:3000


    #valida texto de cadastro
    Get Text             css=#signup h2
    ...        equal    
    ...    Faça seu cadastro e venha para a Smartbit!
    
    #ato
    #realiza os imputs nos campos

    Fill Text            id =name        Leonardo
    Fill Text            id =email       leonardo@hot.com
    Fill Text            id =document    86918027000
    #clica no sumimit (cadastrar)
    Click                css=button >> text=Cadastrar
    #Click        xpath=//button[text()="Cadastrar"]

    #verificação da caixa de (notice) mostrando alertas dinamicos aqui usamos css 
    Wait for Elements State    
    ...    css=form .notice    
    ...    visible    5
    Get Text    css=form .notice    equal  Oops! O CPF informado é inválido  
    
    Sleep    5    