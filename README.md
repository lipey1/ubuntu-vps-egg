# Ubuntu VPS Egg para Pterodactyl

Este é um egg para criar uma VPS Ubuntu no Pterodactyl Panel com seleção interativa de versão durante a instalação.

## Versões Suportadas

- Ubuntu 24.04 LTS (Noble Numbat) - Desenvolvimento
- Ubuntu 23.10 (Mantic Minotaur) - Atual
- Ubuntu 22.04 LTS (Jammy Jellyfish)
- Ubuntu 20.04 LTS (Focal Fossa)
- Ubuntu 18.04 LTS (Bionic Beaver)
- Ubuntu 16.04 LTS (Xenial Xerus)

## Características

- Menu interativo para seleção da versão durante a instalação
- Suporte a SSH
- Ambiente configurado com locales en_US.UTF-8
- Pacotes básicos pré-instalados:
  - curl, wget, sudo
  - openssh-server
  - nano, htop
  - net-tools
  - e mais...

## Como Usar

1. Importe o egg no seu painel Pterodactyl
2. Crie um novo servidor usando este egg
3. Durante a instalação, selecione a versão do Ubuntu no menu interativo
4. Aguarde a conclusão da instalação
5. Inicie o servidor

## Observações

- A seleção da versão é feita através de um menu interativo durante a instalação
- Todas as versões incluem as ferramentas básicas necessárias
- O sistema é configurado com suporte completo a UTF-8