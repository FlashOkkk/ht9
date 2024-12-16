#!/bin/bash

# Оновлення системи
apt update -y && apt upgrade -y

# Встановлення Docker
apt install -y docker.io

# Додавання користувача ubuntu до групи docker
usermod -aG docker ubuntu

# Налаштування Docker для прослуховування на localhost:2375
cat <<EOF > /etc/docker/daemon.json
{
    "hosts": ["unix:///var/run/docker.sock", "tcp://127.0.0.1:2375"]
}
EOF

# Перезапуск Docker
systemctl restart docker
