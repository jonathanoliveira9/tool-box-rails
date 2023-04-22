ADD . /var/www/app/current

WORKDIR /var/www/app/current
RUN sudo chown root:docker /var/www/app/current/bin/start-puma
RUN apt-get update && apt-get install -y iputils-ping

RUN bundle install

CMD bin/start-puma