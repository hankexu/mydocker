FROM rabbitmq:3-management
COPY pre-entrypoint.sh /
COPY rabbitmq-cluster /usr/local/bin/
EXPOSE 5672 15672 25672 4369 9100 9101 9102 9103 9104 9105
ENTRYPOINT ["/pre-entrypoint.sh"]
CMD ["rabbitmq-cluster"]


