ADD . /var/www/app/current

WORKDIR /var/www/app/current

USER root 

RUN chmod 755 /var/www/app/current/bin/start-puma

RUN apt-get update && apt-get install -y iputils-ping

RUN bundle install

CMD bin/start-puma