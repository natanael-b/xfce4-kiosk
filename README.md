# xfce4-kiosk
Adiciona um modo kiosk ao XFCE por padrão

# O que é?

Um modo kiosk nada mais é que um mecanismo para impedir modificações na interface, no mundo Linux uma interface que não só possui um modo kiosk como é o comportamento padrão, é o GNOME Shell

# Por que?

O XFCE é frequentemente utilizado em ambientes escolares, empresariais e até doméstico para pessoas que não pussuem conhecimento técnico aprofundado
Isso costuma resultar em usuários quebrando a interface e por não terem o conhecimento técnico necessário, sendo incapazes de recuperar a interface original

# Como?

Esse repositório pega o exato mesmo código da release atual do Ubuntu, e aplica um pequeno "remendo" no código que desativa as chamadas para as opções da biblioteca responsável pelo suporte a plugins que permitem alterar o painel diretamente

# E se eu quiser editar?

Nesse caso é bem simples, apenas a chamada através do clique no painel foi desativada, usando o terminal você pode chamar a mesma tela com o comando abaixo:

```bash
xfce4-panel -p
```

# Onde baixo?

Acessando as Releases na Tag #Continuous você irá obter o arquivo `pacotes.tar.gz` nesse arquivo você encontra o `xfce4-panel` e os plugins docklike e thunar-share (por que não?) pré-compilados em `amd64`

# Esse repositório está abandonado?

Esse código em teoria só é modificado em 2 cenários, sendo o primeiro, um novo plugin ou uma nova release do Ubuntu é liberada e o segundo, o próprio código do XFCE sofrer modificações que impeçam a execução do script, então não espere ver muita movimentação por aqui, no máximo a cada 2 anos
