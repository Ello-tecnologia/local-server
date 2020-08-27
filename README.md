# Configurações do Servidor Maeve

Este repositório contém as instruções para inicializar o servidor Maeve.


## Checklist

- FTP
- Samba
- Backup automático Firebird
- Cron
- Webservice licença
- Docker
  - apache
    - www.ellotecnologia.net.br
    - os.ellotecnologia.net.br
    - wiki.ellotecnologia.net.br
  - galadriel
  - mongodb
  - jacobalberty/firebird:2.5.8-ss


## Letsencrypt

Para criar os certificados:

    certbot

Para atualizar certificados:

    certbot certonly


## Para construir a imagem

    docker build -t ello/apache .


## Para inicializar o container

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
