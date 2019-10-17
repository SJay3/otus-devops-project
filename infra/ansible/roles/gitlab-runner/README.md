Gitlab-runner
=========

Deploy gitlab-runner in docker-container and register it. Based on riemers.gitlab-runner role.

Requirements
------------

Docker and docker-compose installation.
Ansible 2.7 or higher

Role Variables
--------------

```yaml
gitlab_runner_registration_token: runner registration token
gitlab_runner_coordinator_url: URL of gitlab server
gitlab_runner_runners: A list of gitlab runners to register & configure. Defaults to a single shell executor. See the defaults/main.yml file listing all possible options which you can be passed to a runner registration command.

```


Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

```yaml
    - hosts: all
      vars_files:
      	- vars/main.yml
      roles:
         - { role: gitlab-runner }
```

Inside `vars/main.yml`

```yaml
gitlab_runner_registration_token: 'HUzTMgnxk17YV8Rj8ucQ'
gitlab_runner_runners:
  - name: 'Example Docker GitLab Runner'
    executor: docker
    docker_image: 'alpine'
    tags:
      - node
      - ruby
      - mysql
    docker_volumes:
      - "/var/run/docker.sock:/var/run/docker.sock"
      - "/cache"
    extra_configs:
      runners.docker:
        memory: 512m
        allowed_images: ["ruby:*", "python:*", "php:*"]
      runners.docker.sysctls:
        net.ipv4.ip_forward: "1"
```

License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
