monitoring
=========

This role install all monitoring components in docker containers with docker-compose.
Installation components:
- prometheus
- grafana

Requirements
------------

- docker swarm
- jsondiff
- python docker SDK

Role Variables
--------------

Global veriables

```yaml
prometheus_image: prometheus docker image
grafana_image: grafana docker image
prometheus_scrape_interval: scrape interval in prom config
```

Add jobs in` prometheus_scrape_configs` variable the same as in prometheus scrape config

```yaml
prometheus_scrape_configs:
  - job_name: 'prometheus'
    static_configs:
      - targets:
          - 'localhost:9090'
```

Attach networks to prometheus and grafana in docker-compose file

```yaml
prometheus_networks:
  - prometheus

grafana_networks:
  - prometheus
```

Global defining networks in compose file. Networks definde in other compose-files must be defined here with `external: true`

```yaml
monitoring_networks:
  - prometheus:
      external: false

```

Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - role: monitoring

License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
