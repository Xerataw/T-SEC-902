## How to use

### Modification

Edit "providers.tf" to add your subscription id. Edit "variables.tf" to add your ressource group name.

### Launch

 - Generate a ssh key 
```shell
mkdir terraform_azure_key_ssh
cd terraform_azure_key_ssh
ssh-keygen -t ed25519 -f sec_azure_key
```
 - Launch Terraform 
```shell
terraform init --upgrade
terraform plan -out "main.tfplan"
terraform apply "main.tfplan"
```



