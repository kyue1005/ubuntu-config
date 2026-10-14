# Kubectl aliases
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
