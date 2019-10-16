Gitlab-runner
=========

Deploy gitlab-runner in docker-container and register it. Based on riemers.gitlab-runner role.

Requirements
------------

Docker and docker-compose installation.

Role Variables
--------------

```yaml
gitlab_runner_registration_token: runner registration token
gitlab_runner_coordinator_url: URL of gitlab server
gitlab_runner_runners:

```

Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: gitlab-runner }

License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
