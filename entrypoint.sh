#!/bin/bash
cd /home/container

# Garante que as permissões estejam corretas
chown -R root:root /root
chmod -R 755 /root

# Inicia o serviço SSH se necessário
if [ -f /etc/ssh/sshd_config ]; then
    /etc/init.d/ssh start
fi

# Mantém o container rodando
tail -f /dev/null 