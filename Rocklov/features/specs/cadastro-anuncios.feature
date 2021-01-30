#language: pt

Funcionalidade: Cadastro de Anúncios
    Sendo usuário cadastro no Rocklov que possui equipamentos musicais
    Quero cadastrar meus equipamentos
    Para que eu possa disponibilizalos para locação

    Contexto: Login
    * Login com "neo@gmail.com" e "1234"


    Cenario: Novo equipo

        Dado que acesso o formulario de cadastro de anúncios
            E que eu tenho o seguinte equipamento:
            | thumb     |fender-sb.jpg  |
            | nome      | Fender Strato |
            | categoria | Cordas        |
            | valor     | 200           |
        Quando submeto o cadastro desse item
        Então devo ver esse item no meu Dashboard
    @temp1
    Esquema do Cenario: Tentativa de cadastro de anúncios

          Dado que acesso o formulario de cadastro de anúncios
            E que eu tenho o seguinte equipamento:
            | thumb     | <foto>        |
            | nome      | <nome>        |
            | categoria | <categoria>   |
            | valor     | <preco>       |
        Quando submeto o cadastro desse item
        Então deve conter a mensagem de alerta: "<saida>"


        Exemplos:
        | foto          | nome            | categoria | preco | saida                                 |
        |               | Violao de Nylon | Cordas    | 150   | Adicione uma foto no seu anúncio!     |
        | clarinete.jpg |                 | Outros    | 250   | Informe a descrição do anúncio!       |
        | mic.jpg       | Microfone Shure |           | 100   | Informe a categoria                   |
        | trompete.jpg  | Trompete Class  | Outros    |       | Informe o valor da diária             |
        | conga.jpg     | Gonga           | Outros    | abc   | O valor da diária deve ser numérico   |
        | conga.jpg     | Gonga           | Outros    | 123a  | O valor da diária deve ser numérico   |