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
- Add parametr to run provissioner in terraform or not
- Install gitlab-runner into stage and prod with ansible
- Create monitoring inrastracture (prometheus + grafana)
- Add infra node to monitoring
- Add Gitlab to monitoring
- Create Grafana Dashboards
- Add supported version of software in Readme
- Update readme in gitlab role
- Add description how gitlab working with crawler in readme

## [Unreleased]

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
