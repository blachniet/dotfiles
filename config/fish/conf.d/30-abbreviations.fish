if status is-interactive
    # Git abbreviations
    abbr -a g git
    abbr -a gs git status
    abbr -a ga git add
    abbr -a gaa git add --all
    abbr -a gc git commit
    abbr -a gcm git commit -m
    abbr -a gp git push
    abbr -a gl git pull
    abbr -a gd git diff
    abbr -a gco git checkout
    abbr -a gcb git checkout -b
    abbr -a gb git branch
    abbr -a gbd git branch -d
    abbr -a glog git log --oneline --graph --decorate
    abbr -a gst git stash
    abbr -a gstp git stash pop
    abbr -a gclean git branch --merged | grep -v "\*" | xargs -n 1 git branch -d

    # Terraform abbreviations
    abbr -a tf terraform
    abbr -a tfi terraform init
    abbr -a tfp terraform plan
    abbr -a tfa terraform apply
    abbr -a tfaa terraform apply -auto-approve
    abbr -a tfd terraform destroy
    abbr -a tfv terraform validate
    abbr -a tff terraform fmt
    abbr -a tfw terraform workspace
    abbr -a tfo terraform output

    # Kubernetes abbreviations
    abbr -a k kubectl
    abbr -a kgp kubectl get pods
    abbr -a kgs kubectl get services
    abbr -a kgd kubectl get deployments
    abbr -a kgn kubectl get nodes
    abbr -a kga kubectl get all
    abbr -a kdp kubectl describe pod
    abbr -a kds kubectl describe service
    abbr -a kl kubectl logs
    abbr -a klf kubectl logs -f
    abbr -a kx kubectl exec -it
    abbr -a kctx kubectl config use-context
    abbr -a kns kubectl config set-context --current --namespace
    abbr -a kdel kubectl delete
    abbr -a kapp kubectl apply -f

    # Docker abbreviations
    abbr -a d docker
    abbr -a dc docker compose
    abbr -a dcu docker compose up
    abbr -a dcd docker compose down
    abbr -a dps docker ps
    abbr -a dpsa docker ps -a
    abbr -a di docker images
    abbr -a dex docker exec -it
    abbr -a dlogs docker logs -f

    # Common utilities
    abbr -a ll ls -lah
    abbr -a la ls -A
    abbr -a l ls -CF
end
