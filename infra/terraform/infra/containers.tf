#### INFRA ENV ####

resource "null_resource" "deploy_containers" {
  depends_on = [module.docker]

  provisioner "local-exec" {
    command = "ansible-playbook playbooks/gitlab.yml"
    working_dir = "../../ansible"
  }
}
