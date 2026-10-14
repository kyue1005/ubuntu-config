# Terraform aliases
alias tf="terraform"
alias tfi='terraform init'
alias tfir='terraform init -reconfigure'
alias tfiu='terraform init -upgrade'
alias tfv='terraform validate'
alias tfa='terraform apply'
alias tfapp='terraform apply tfplan'
alias tfd='terraform destroy'
alias tfs='terraform state'
alias tiv="terraform init && terraform validate"
alias tivp="terraform init && terraform validate && terraform plan -out tfplan"
