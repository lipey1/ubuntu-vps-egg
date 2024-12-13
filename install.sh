#!/bin/bash

# URL base onde os arquivos estarão hospedados
FILES_URL="https://raw.githubusercontent.com/SEU_USUARIO/ubuntu-vps-egg/main"

# Download dos arquivos necessários
curl -o Dockerfile "${FILES_URL}/Dockerfile"
curl -o entrypoint.sh "${FILES_URL}/entrypoint.sh"
chmod +x entrypoint.sh

# Verifica se a versão do Ubuntu é válida
if [[ ! "${UBUNTU_VERSION}" =~ ^(22\.04|20\.04|18\.04)$ ]]; then
    echo "Versão do Ubuntu inválida. Use 22.04, 20.04 ou 18.04"
    exit 1
fi

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

echo "Instalação concluída com sucesso!" 