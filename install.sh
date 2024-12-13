#!/bin/bash

# Configuração do menu de seleção
TITLE="Instalação do Ubuntu VPS"
MENU_TITLE="Selecione a versão do Ubuntu"
MENU_TEXT="\nEscolha a versão do Ubuntu para instalar:\n\nUse as setas ↑↓ para navegar e ENTER para selecionar"

# Array com as versões disponíveis
VERSIONS=(
    "24.04" "Noble Numbat (Desenvolvimento)"
    "23.10" "Mantic Minotaur (Atual)"
    "22.04" "Jammy Jellyfish (LTS)"
    "20.04" "Focal Fossa (LTS)"
    "18.04" "Bionic Beaver (LTS)"
    "16.04" "Xenial Xerus (LTS)"
)

# Função para mostrar o menu de seleção
show_menu() {
    UBUNTU_VERSION=$(dialog --clear --title "$TITLE" \
                           --menu "$MENU_TEXT" \
                           20 60 6 \
                           "${VERSIONS[@]}" \
                           2>&1 >/dev/tty)
    
    clear
}

# Mostra o menu de seleção
show_menu

# Verifica se uma versão foi selecionada
if [ -z "${UBUNTU_VERSION}" ]; then
    echo "❌ Nenhuma versão selecionada. Instalação cancelada."
    exit 1
fi

echo "🔄 Iniciando instalação do Ubuntu ${UBUNTU_VERSION}..."

# Cria o Dockerfile com a versão específica
cat > Dockerfile <<EOF
FROM ubuntu:${UBUNTU_VERSION}

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get install -y \
        curl \
        wget \
        sudo \
        bash \
        openssh-server \
        ca-certificates \
        locales \
        dialog \
        nano \
        htop \
        net-tools \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && locale-gen en_US.UTF-8

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
EOF

echo "✅ Instalação do Ubuntu ${UBUNTU_VERSION} concluída com sucesso!"
echo
echo "📝 Informações da versão instalada:"
case ${UBUNTU_VERSION} in
    "24.04") echo "Ubuntu Noble Numbat - Versão em desenvolvimento (Abril 2024)" ;;
    "23.10") echo "Ubuntu Mantic Minotaur - Versão atual (Outubro 2023)" ;;
    "22.04") echo "Ubuntu Jammy Jellyfish - Versão LTS (Suporte até 2027)" ;;
    "24.04") echo "Ubuntu Noble Numbat - Versão em desenvolvimento" ;;
    "23.10") echo "Ubuntu Mantic Minotaur - Versão atual" ;;
    "22.04") echo "Ubuntu Jammy Jellyfish - Versão LTS" ;;
    "20.04") echo "Ubuntu Focal Fossa - Versão LTS" ;;
    "18.04") echo "Ubuntu Bionic Beaver - Versão LTS" ;;
    "16.04") echo "Ubuntu Xenial Xerus - Versão LTS" ;;
esac 