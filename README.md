# fiveM-server
Servidor de FiveM que eu mexo como aprendizado.

## Baixe o artifacts Server
Baixe o artifacts que preferir do site: [artifacts server](https://runtime.fivem.net/artifacts/fivem/build_server_windows/master/).
Extraia o zip dentro da pasta [artifacts](/artifacts).

## Baixe e instale o MySql
Eu recomendo o [Xamp](https://www.apachefriends.org/pt_br/index.html) junto com o [HeidiSQL](https://www.heidisql.com) (Para gerenciamento).

## Criando o banco de dados
Execute o script [database.sql](/[MySQL]/database.sql) para criar o banco de dados.

## Edite o arquivo server.cfg
Abra o arquivo [server.cfg](server.cfg);

Edite a linha **5** caso tenha alguma informação diferente (*user*, *senha*, *nome do banco*).

Caso queira mudar a Build que seu servidor ira rodar mude na linha **6**.

Edite as linhas **211 e 212** substituindo a palavra **hex** pela sua steam hex;

Edite a linha **225** substituindo a palavra **steamAPI** por sua Steam Web API key;
> Pode ser encontrada aqui [SteamAPI](https://steamcommunity.com/dev/apikey)

Edite a linha **228** substituindo a palavra **FiveMKey** por sua License Key do FiveM.
> Pode ser encontrada aqui [FiveM Key](https://keymaster.fivem.net)