FROM alpine
RUN apk update
RUN apk add logrotate
RUN echo "* * * * root /etc/logrotate" >> rotatecron
run crontab rotatecron
ADD ./logrotate.conf /etc/logrotate.conf
CMD sleep
