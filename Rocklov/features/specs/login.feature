#language: pt

Funcionalidade: Login
    Sendo um usuário cadastrado
    Quero acessar o sistema da Rocklov
    Para que eu possa anunciar meus equipamentos musicais

    @temp
    Cenario: Login do usuário

        Dado que acesso a página principal
        Quando submeto minhas credenciais com "gihmaia1@gmail.com" e "abc"
        Então sou redirecionado para o Dashboard
    @ten
    Esquema do Cenario: Tentar logar

        Dado que acesso a página principal
        Quando submeto minhas credenciais com "<email_input>" e "<senha_input>"
        Então vejo a mensagem de alerta: "<mensagem_output>"

        Exemplos:
        |email_input          |senha_input |mensagem_output                    |
        |gihmaia1@gmail.com   |1234        |Usuário e/ou senha inválidos.      |
        |gihmoreira1@gmail.com|abc         |Usuário e/ou senha inválidos.      |
        |gihalmeida*yahoo.com |abc         |Oops. Informe um email válido!     |
        |                     |abc         |Oops. Informe um email válido!     |
        |gihmaia1@gmail.com   |            |Oops. Informe sua senha secreta!   |

