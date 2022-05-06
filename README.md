# xfce4-kiosk
Adiciona um modo kiosk ao XFCE baseado em variáveis de ambiente

# O que é?

Um modo kiosk nada mais é que um mecanismo para impedir modificações na interface, no mundo Linux uma interface que não só possui um modo kiosk como é o comportamento padrão, é o GNOME Shell

# Por que?

O XFCE é frequentemente utilizado em ambientes escolares, empresariais e até doméstico para pessoas que não pussuem conhecimento técnico aprofundado
Isso costuma resultar em usuários quebrando a interface e por não terem o conhecimento técnico necessário, sendo incapazes de recuperar a interface original

# Como?

Esse repositório pega o exato mesmo código da release atual do Ubuntu, e aplica um pequeno "remendo" no código que verifica se a variável ambiente `XFCE4_KIOSK_MODE` está definida, caso esteja, ela impede que o XFCE ative as opções do menu de contexto que permitem modificar a interface

# Onde baixo?

Acessando as Releases na Tag #Continuous você irá obter uma lista de arquivos, sendo ela:

- `pacotes.tar.gz` nesse arquivo você encontra o `xfce4-panel` e todos os plugins que estão no repositório Ubuntu pré-compilados em `amd64`
- `patches.tar.gz` nesse você encontra arquivos `.diff` gerados pelo script das modificações no `Whisker Menu` e no `xfce4-panel`
- `fontes.tar.gz` e por fim nesse você encontra o arquivo de fontes que você pode usar para compilar você mesmo para outras arquiteturas

# Esse repositório está abandonado?

Esse código em teoria só é modificado em 2 cenários, sendo o primeiro, um novo plugin ou uma nova release do Ubuntu é liberada e o segundo, o próprio código do XFCE sofrer modificações que impeçam a execução do script, então não espere ver muita movimentação por aqui, no máximo a cada 2 anos
