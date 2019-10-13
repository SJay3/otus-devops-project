# otus-devops-project
Repo for graduate work in otus in DevOps

GCP project = devops-254718
[Репозиторий crawler](https://github.com/SJay3/crawler)


## Описание инфраструктуры
Инфраструктура состоит из нескольких контуров: infra, stage, prod. Последие 2 контура - контура для приложения, разворачивающего с помощью конвеера

### infra
Контур infra - это контур для общей инфраструктуры. Состоит из виртуальной машины с докером, внутри которой крутятся в контейнерах крутятся сервисы:
- Система контроля версий (gitlab)
- Конвеер развертывания (gitlab)
- Система мониторинга (prometheus, grafana)

### Stage и Prod
2 контура, предназначенных для работы приложения. Оба контура идентичны в плане инфраструктуры. Различия лишь в том, что в stage выкатывается тестовая версия приложения (например, с ветки develop), а в prod стабильная и рабочая версия с ветки master или release в зависимости от используемого gitflow (В проекте будет использован деплой с ветки master).
Каждый контур состоит из отдельной виртуальной машины с докером внутри. Виртуальные машины не должны иметь прямой доступ друг к другу. В контейнерах крутятся приложения (с необходимыми для их работы сервисами, такими как БД или очередь), а так же сопутствующие сервисы, необходимые для организации мониторинга, логирования или конвеера.


## Предварительная подготовка

### Packer
Версия пакера > 1.4.4
Можно использовать, как application default credentials (по умолчанию), так и указать путь к ключу для сервис аккаунта GCP (переменная account_file).

### Terraform
Версия > 0.12.0
Можно использовать как application default credentials (по умолчанию), так и указать путь к ключу для сервис аккауна GCP (переменная `gcp_key_path`).

### Ansible
Версия > 2.8.3
Для работы ансибла отдельно от пакера или терраформа, необходимо использовать сервисный аккаунт GCP. Ключ к аккаунту прописан в файле inventory.gcp.yml и имеет значение `~/ansible_gcp-devops_key.json`. Для ручного применения ансибла, в файле ansible.cfg так же необходимо прописать путь к приватному ключу и юзера, у которого есть доступ к ВМ, развернутой терраформом.

Необходимо так же создать ключ ansible vault для infra окружения. 

```shell
echo <randomString> > ~/ansible_vault_devops_infra.key
```

Далее создаем файл ansible/group_vars/infra/vault.yml со следующим описанием

```yaml
---
gitlab_initial_pass: <password>

```

После чего, зашифруем файл:

```shell
ansible-vault encrypt \
--vault-password-file ~/ansible_vault_devops_infra.key \
ansible/group_vars/infra/vault.yml
```

Подтягиваем сторонние роли:

```shell
ansible-galaxy install -r requirements.yml
```

## Использование
0. Создать образ докера

```shell
cd infra
packer build -var-file=packer/variables.json packer/docker.json
```

1. Поднять основную инфраструктуру:

```shell
cd infra/terraform
terraform init
terraform apply
```

2. Поднять инфраструктуру окружения **infra**

```shell
cd infra/terraform/infra
terraform init
terraform apply
```

3. Залогиниться в гитлабе. Отключить регистрацию в настройках. 
4. Зайти в профиль и сгенерировать personal access token. Скопировать этот токен в файл infra/ansible/vars/gitlab.yml в `gitlab_personal_token`.
5. Запустить плейбук gitlab_conf.yml для дальнейшего конфигурирования гитлаба. Будут созданы группы репозитории в них.
6. 
