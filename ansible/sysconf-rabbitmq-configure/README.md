# RABBITMQ CONFIGURE (ROLES) CONFIGURATION

Role is idempotent.

### Example config:
```
rabbitmq_config_dc:

  - instance: rabbitmq-prod
    rabbitmq_cluster_fqdn: rabbitmq-prod
    rabbitmq_default_user: 'admin'
    rabbitmq_default_vhost: 'prod'
    rabbitmq_amqp_ssl_port: 5671
    rabbitmq_http_ssl_port: 15671
    rabbitmq_max_message_size: 52428800
    rabbitmq_default_message_ttl: 604800000 # milisec
    vault_deploy_url: https://vault.service.
    vault_ansible_creds_url: https://vault.service.
    nodes:
      - fqdn: rabbitmq-node01-prod
        id: 'RabB'
      - fqdn: rabbitmq-node02-prod
        id: 'UFZU'
      - fqdn: rabbitmq-node03-prod
        id: '2zBR'
```

