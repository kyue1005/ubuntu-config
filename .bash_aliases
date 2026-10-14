# kubectl aliases
alias kns="kubectl ns"
alias kctx="kubectl ctx"
alias k="kubectl"
alias kdp='kubectl describe pod'
alias kdn='kubectl describe node'
alias kgp='kubectl get po'
alias kgpa='kubectl get po --all-namespaces'
alias kgpe='kubectl get po --all-namespaces | egrep -v "Running|Completed"'
alias kgn='kubectl get node'
alias kl='kubectl logs -f'
alias ktp='kubectl top pod'
alias ktn='kubectl top node'
alias ksql='kubectl delete po mysql-cli; kubectl run mysql-cli --image=mysql:5.7 -it --rm --restart=Never -- /bin/bash;'
alias kmongo='kubectl delete po mongo; kubectl run mongo --image=mongo:5.0 -it --rm --restart=Never -- /bin/bash;'
alias kpsql='kubectl delete po postgres; kubectl run postgres --image=postgres:13 -it --rm --restart=Never -- /bin/bash;'
alias kcurl='kubectl delete po curl; kubectl run curl --image=alpine/curl -it --rm --restart=Never -- /bin/sh;'
alias kawscli='kubectl delete po aws-cli; kubectl run aws-cli --image=amazon/aws-cli -it --rm --restart=Never --command -- /bin/bash;'

# git aliases
alias g="git"
alias ga='git add'
alias gam='git am'
alias gst='git status'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gcm='git checkout $(git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@')'
alias gcmsg='git commit --message'
alias gd='git diff'
alias gl='git pull'
alias gp='git push'
alias gpra='git pull --rebase --autostash'
alias grb='git rebase'
alias gtl='gtl(){ git tag --sort=-v:refname -n --list "${1}*" }; noglob gtl'

# terraform aliases
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

# pulumi aliases
alias pul='pulumi'
alias pulcs='pulumi config set'
alias puld='pulumi destroy'
alias pullog='pulumi logs -f'
alias pulp='pulumi preview'
alias pulpd='pulumi preview --diff --color=always | less -R'
alias pulr='pulumi refresh'
alias puls='pulumi stack'
alias pulsh='pulumi stack history'
alias pulsi='pulumi stack init'
alias pulsl='pulumi stack ls'
alias pulso='pulumi stack output'
alias pulss='pulumi stack select'
alias pulu='pulumi up'