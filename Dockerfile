FROM alpine
ADD ./logrotate.conf /etc/logrotate.conf
RUN apk update \
    && apk add logrotate \
    && touch crontab.tmp \
    && echo '*/1 * * * * root logrotate /etc/logrotate.conf' > crontab.tmp \
    && crontab crontab.tmp \
    && rm -rf crontab.tmp
CMD ["crond", "-l", "2", "-f"]
