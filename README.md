# T-SEC-902
## Project setup
1. Install Terraform -> https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli
2. Initialize the project
```shell
terraform init --upgrade
```
3. Init the subscription env variable
```shell
export ARM_SUBSCRIPTION_ID="<subscription-ID>" #For mac @ Linux
setx ARM_SUBSCRIPTION_ID "<subscription-ID>" #For Windows
```
4. You may need to update the state of the resource group
```shell
terraform import azurerm_resource_group.rg-group-16 "/subscriptions/<subscription-id>/resourceGroups/rg-group-16"
```
## Use terraform
1. Write your config
2. Validate and plan your config
```shell
terraform plan
```
3. Format the code
```shell
terraform fmt
```
4. Apply the code
```shell
terraform apply -auto-approve
```
5. If you want to delete the infrastructure ⚠️ Be sure no one is using it
```shell
terraform destroy -auto-approve
```



