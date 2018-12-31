# Ansible-Terraform-Trigger

This ansible playbook can be used to spin-up infra by triggering terraform scipts. This uses ansible's inbuilt terraform module.

### Prerequisites
  - Terraform Installed on Target Machine.
  - Ansible 2.5+ ( 2.7+ to use Terraform's backend_config)

### Usage
This playbook triggers a terraform script which creates an ec2-instance in a default VPC. 
This is an example that helps to understand how terraform variables can be referenced using Ansbile Vars. 
This can be a starting point for a long way to integrate much complex infrastructure with Ansible using Terraform.

### Variables
| VariableName | Significance |
| ------ | ------ |
| amiId | ami-Id of EC2 Instance |
| subnetId | Subnet-Id of EC2 Instance |
| ownerName | EC2 Instance Owner Tag |
| nameTag |  EC2 Instance Name Tag |
| s3BackendBucket | Terraform S3 Backend Config |
| s3BackendKey | Terraform S3 Backend Bucket Key |
| s3BackendRegion |Terraform S3 Backend Region |

### Execution
This ansible playbook works loocally and update the hosts to work on remote machines.
Make sure the machine/user has suitable permissions to execute terraform.
```sh
$ ansible-playbook tf-plan.yml
```
Another way to create terraform plan is to execute playbook using Check mode.

```sh
$ ansible-playbook tf-apply.yml --check
```

### Execution with Jenkins
This ansible cookbook can be integrated with jenkins and automate the build process. The prerequisites for jenkins are.
* Install Ansible on jenkins machine locally.
* Install Ansible plugin and create global configuration for Ansible with executable path.
* Install Terraform on jenkins machine locally [on target machine].
* Install terraform plugin.
* Make sure jenkins user has permissions to execute ansible playbooks.

Create an new build job which invokes ansible-playbook which refers path to the ansible-playbook. 
Add additional variables if necessary which can be passed while command execution.

### References
[Ansible-Terraform Module](https://docs.ansible.com/ansible/latest/modules/terraform_module.html)
[Ansible Variables](https://docs.ansible.com/ansible/latest/user_guide/playbooks_variables.html#defining-variables-in-a-playbook)
[Terraform Variables](https://learn.hashicorp.com/terraform/getting-started/variables)
[Terraform Backend_Configuration](https://www.terraform.io/docs/backends/config.html)
