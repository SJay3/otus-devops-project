# Changelog

Каждая версия должна:

- Показывать дату релиза в формате, упомянутом выше.
- Группировать изменения согласно их влиянию на проект следующим образом:
  - [Added] для новых функций.
  - [Changed] для изменений в существующей функциональности.
  - [Deprecated] для функциональности, которая будет удалена в следующих версиях.
  - [Removed] для функциональности, которая удалена в этой версии.
  - [Fixed] для любых исправлений.
  - [Security] для обновлений безопасности.

## [ToDo]
- [Security] Hide grafana login and password in moonitoring role. Use encrypted password.
- Add stage and prod nodes to monitoring
- Add Gitlab to monitoring
- Create Grafana Dashboards
- Add supported version of software in Readme
- Add description how gitlab working with crawler in readme
- [Ansible] Configure runner in infra for concurrent jobs
- [Docker] Create Docker image with docker-compose.
- [Terraform] Repace paths to start terraform from terraform folder

## [Unreleased]
### Fixed
- [Ansible] Role: monitoring. fix variables for node-exporter

### Added
- [Docker] Add build mongo image to makefile

### [0.1.7] 2019-10-29
### Fixed
- [Ansible] Role: monitoring. Run handler only if docker stack not changed, but config is changed
- [Ansible] Fix monitoring group_vars

### Added
- [Terraform] Add crawler engine metrics port to vars. Create firewall rules
- [Ansible] Add handler for prometheus
- [Docker] Add trickster image
- [Docker] Add grafana image
- [Ansible] Add grafana and trickster to monitoring role
- [Ansible] Add alertmanager to monitoring role
- [Docker] Add alertmanager image
- [Terraform] Add firewall rule for metrics ports in stage and prod
- [Ansible] Role: monitoring. Add node-exporter to compose file 

## [0.1.6] 2019-10-27
### Added
- [Ansible] Role: monitoring. Deploy prometheus
- [Ansible] Create swarm cluster. Need to use docker-compose files > 3 version and deploy it with docker_stack.
- [Terraform] Add GCP firewall rules for prometheus
- [Terraform] Add GCP firewall rules for grafana
- [Ansible] Add waiting until ssh is reacheble in ansible. Playbook `wait.yml`.

### Changed
- [Ansible] Deploy gitlab using docker stack deploy with compose file

### Fixed
- [Packer] Fix docker-compose installation. Use pip instead of apt

## [0.1.5] 2019-10-21
### Removed
- [Ansible] fix variables for docker runner registration in infra. Remove unix socket volume mount because it broke dind service.
- [Terraform] Remove sleep in ansible provisioner.

### Added
- [Ansible] Add gitlab-runner configuration option `wait_for_services_timeout`. Needs becouse docker:dind starts slowly and warning is shown.
- [Terraform] Create firewall rules for port 8000 with terraform
- [Terraform] Add parametr to run provissioner in terraform or not
- [Ansible] Add waiting until ssh is reacheble. Add playbook `wait.yml`. Import this playbook into gitlab.yml

### Fixed
- [Ansible] fix runner registration. Register runner only once. Add when statement to include register task, that true if installation task is changed.
- [Ansible] Fix host unreacheble when running playbook in terraform


## [0.1.4] 2019-10-17
### Added
- Install gitlab-runner into stage and prod with ansible. Playbook `gitlab-runner.yml`

### Fixed
- Fix docker installation ansible playbook to reconfigure docker to listen tcp sockets with unix socket.

### Changed
- Update readme in gitlab role

## [0.1.3] 2019-10-16
### Changed
- Update readme in section how to use this repo

## [0.1.2] 2019-10-16
### Added
- Added gitlab-runner custom ansible role. Role based on riemers.gitlab-runner role, but install runner only in docker container.
- Ansible playbook to install gitlab-runner into infra.

### Fixed
- Fix when apt fails with dpkg lock. Add update cache task and remove update cache in pkg installation

## [0.1.1] 2019-10-13
### Added
- Create groups and projects in gitlab with ansible. Playbook `gitlab_conf.yml`

### Changed
- Add dependencies to gitlab playbook

### Removed
- Remove docker installation with pip in base playbook.

### Fixed
- fix timeouts for ssh connection in terraform ansible provisioner. Add sleep 20s before execute ansible
- Fix when apt fails with dpkg lock. Add remove lock file after python install.

## [0.1.0] 2019-10-09
### Added
- Terraform module docker
- Terraform environments infra, stage and prod
- Ansible roles docker and gitlab

### Changed
- Packer configuration can use account file or gcp application credentials

### Security
- Gitlab installation with ansible must use encrypted admin password (encrypted with ansible vault)
- Hide ansible output with gitlab admin password

## [0.0.1] - 2019-10-02
### Added
- gitignore file
- Ansible, packer and terraform projects
- Readme file
