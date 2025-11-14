# RABBITMQ CONFIGURE (ROLES) CONFIGURATION

Role is idempotent.

Run as:
```
ansible-playbook playbooks/sysconf.yml --extra-vars "configure=rabbitmq-configure" --extra-vars "nodes=cd04" --extra-vars "rbmqinstances=rabbitmq-prod.service.cd04.lab"
```

## Config

Config should be put in 60-rabbitmq.yml under group vars dir.

### Example config:
```
rabbitmq_config_cd04:

  - instance: rabbitmq-prod.service.cd04.lab
    rabbitmq_cluster_fqdn: rabbitmq-prod.service.cd04.lab
    rabbitmq_default_user: 'admin'
    rabbitmq_default_vhost: 'cd04-prod'
    rabbitmq_amqp_ssl_port: 5671
    rabbitmq_http_ssl_port: 15671
    rabbitmq_max_message_size: 52428800
    rabbitmq_default_message_ttl: 604800000 # milisec
    vault_deploy_url: https://vault.service.cd04.lab:8200/v1/deployment_cd04/data/cd04-prod
    vault_ansible_creds_url: https://vault.service.star.lab:8200/v1/ansible/data/cd04/rabbitmq/rabbitmq-prod.service.cd04.lab
    nodes:
      - fqdn: rabbitmq-node01-prod.service.cd04.lab
        id: 'RabB'
      - fqdn: rabbitmq-node02-prod.service.cd04.lab
        id: 'UFZU'
      - fqdn: rabbitmq-node03-prod.service.cd04.lab
        id: '2zBR'
```

