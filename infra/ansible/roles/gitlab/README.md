gitlab
=========

Install gitlab omnibus in docker container with docker-compose

Requirements
------------

This role requierd VM with docker installlation.

Role Variables
--------------

```
gitlab_external_ip: external ip address of docker VM. Used in gitlab address in env var external_upl
gitlab_hostname: hostname of gitlab. Default gitlab.example.com. Used in compose file

```

Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }

License
-------

FREE

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
