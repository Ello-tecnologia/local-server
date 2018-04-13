# Configurações do Servidor principal

Este repositório contém as instruções para inicializar o servidor principal.


# Checklist

- FTP
- Samba
- Backup automático Firebird
- Cron
- Virtualbox / Windows7
- Webservice licença
- Docker
  - apache
    - www.ellotecnologia.net.br
    - os.ellotecnologia.net.br
    - wiki.ellotecnologia.net.br
  - galadriel
  - mongodb
  - jacobalberty/firebird:2.5.8-ss


# Letsencrypt

docker run --rm \
    -p 80:80 \
    -p 443:443 \
    --name letsencrypt \
    -v letsencrypt_certificates:/etc/letsencrypt \
    -e "LETSENCRYPT_EMAIL=clayton@ellotecnologia.net.br" \
    -e "LETSENCRYPT_DOMAIN1=os.ellotecnologia.net.br" \
    blacklabelops/letsencrypt install


# Para construir a imagem

docker build -t ello/apache .


# Para inicializar o container

docker run -d --name apache \
  -p 80:80 \
  -p 443:443 \
  -v /srv/www/cgi-bin:/usr/lib/cgi-bin/ \
  -v /srv/www/html:/var/www/html \
  -v /srv/www/ws/:/var/www/ws \
  -v /srv/ftp/Downloads:/srv/ftp/Downloads \
  -v letsencrypt_certificates:/etc/letsencrypt \
  -v letsencrypt_challenges:/var/www/letsencrypt \
  --restart=unless-stopped \
  ello/apache
