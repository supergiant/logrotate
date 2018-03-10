FROM alpine
RUN apk update
RUN apk add logrotate
RUN echo "*/15 * * * * root /etc/logrotate" >> rotatecron
run crontab rotatecron
ADD ./logrotate.conf /etc/logrotate.conf
CMD sleep 1000000000
