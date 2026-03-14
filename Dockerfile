FROM ubuntu:24.04

# Nyiapin environment biar gak ditanya-tanya pas install
ENV DEBIAN_FRONTEND=noninteractive

# Install bahan dasar
RUN apt-get update && apt-get install -y curl sudo php-cli php-common php-gd php-mysql php-mbstring php-bcmath php-xml php-curl php-zip mariadb-server nginx

# Copy script lu ke dalam container
COPY install.sh /install.sh
RUN chmod +x /install.sh

# Jalankan script pas container nyala
CMD ["/bin/bash", "/install.sh"]
