FROM alpine:latest
  
ENV DOMAINS=www.example.com
ENV EMAIL=your@email.com

RUN apk update
RUN apk add --no-cache certbot
RUN apk add python
RUN echo "0 0,12 * * * python -c 'import random; import time; time.sleep(random.random() * 3600)' && certbot renew -q" | tee -a /etc/crontabs/root > /dev/null

CMD certbot certonly --standalone --non-interactive --agree-tos --domains $DOMAINS --email $EMAIL \
    && sh
