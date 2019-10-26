#### INFRA ENV ####

resource "null_resource" "deploy_containers" {
  count      = var.enable_ansible_provisioner ? 1 : 0
  depends_on = [module.docker]

  provisioner "local-exec" {
    command     = "ansible-playbook --vault-password-file ${var.ansible_vault_key} playbooks/infra-tf-configure.yml"
    working_dir = "../../ansible"
  }

    provisioner "local-exec" {
    command     = "ansible-playbook --vault-password-file ${var.ansible_vault_key} playbooks/gitlab.yml"
    working_dir = "../../ansible"
  }
}
