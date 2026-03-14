#!/bin/bash

# --- KONFIGURASI ---
DB_NAME="kajaj"
DB_USER="jaja"
DB_PASS="paspas123"
TZ="Asia/Jakarta"
EMAIL="admin@domainlu.com"
USER_ADMIN="admin"
FIRST_NAME="Ptero"
LAST_NAME="Admin"
USER_PASS="AdminGanteng123"
DOMAIN="ojipanel.dpdns.org"
# -------------------

# Jalankan database & nginx dulu (PENTING)
find /var/lib/mysql -type f -exec touch {} +
service mariadb start
service nginx start

echo "Memulai Auto-Install Pterodactyl..."

# Eksekusi installer (Input otomatis)
bash <(curl -s https://pterodactyl-installer.se) <<EOF
0
$DB_NAME
$DB_USER
$DB_PASS
$TZ
$EMAIL
$EMAIL
$USER_ADMIN
$FIRST_NAME
$LAST_NAME
$USER_PASS
$DOMAIN
n
n
y
y
y
y
EOF

# Jaga container biar gak mati setelah install selesai
tail -f /var/log/nginx/access.log
