# Ubuntu VPS Egg para Pterodactyl

Este é um egg para criar uma VPS Ubuntu no Pterodactyl Panel com suporte a múltiplas versões.

## Versões Suportadas

- Ubuntu 22.04 LTS
- Ubuntu 20.04 LTS
- Ubuntu 18.04 LTS

## Características

- Seleção de versão do Ubuntu durante a instalação
- Suporte a SSH
- Ambiente configurado com locales en_US.UTF-8
- Pacotes básicos pré-instalados

## Como Usar

1. Importe o egg no seu painel Pterodactyl
2. Crie um novo servidor usando este egg
3. Durante a criação, selecione a versão do Ubuntu desejada
4. Inicie o servidor

## Variáveis de Ambiente

- `UBUNTU_VERSION`: Versão do Ubuntu a ser instalada (22.04, 20.04 ou 18.04) 