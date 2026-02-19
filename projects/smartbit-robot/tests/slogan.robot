*** Settings ***
Library        Browser
Documentation        Teste para validar o Slogan da Smartbit na web


*** Test Cases ***

Deve exibir o Slogan na Landing Page
    New Browser    browser=chromium    headless=False
    New Page        http://localhost:3000
    Get Text        css=.headline h2    equal    Sua Jornada Fitness Começa aqui!

    Sleep    5