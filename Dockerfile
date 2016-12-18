FROM alpine
WORKDIR /opt 
RUN apk add --update bash py-pip docker ca-certificates openssl && rm -rf /var/cache/apk/* && update-ca-certificates
RUN wget https://releases.hashicorp.com/consul-template/0.16.0/consul-template_0.16.0_linux_amd64.zip -O consul-template.zip && unzip consul-template.zip && rm consul-template.zip && mv consul-template /usr/bin
ADD start.sh .
ADD composer.sh .
RUN pip install docker-compose
ENTRYPOINT ["./start.sh"]
