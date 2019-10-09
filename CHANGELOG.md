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
- Create monitoring inrastracture (prometheus + grafana)
- Add infra node to monitoring
- Add Gitlab to monitoring
- Create Grafana Dashboards

## [Unreleased]

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
