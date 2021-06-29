init:
	terraform init

apply_terrafrom: init
	terraform apply -var-file="var_dev_env.tfvars"

destroy_terraform: init
	terraform destroy -var-file="var_dev_env.tfvars"

run: apply_terrafrom

destroy: destroy_terraform

status:
	kubectl get po --kubeconfig=k8-config


check:
	kubectl  exec test  --kubeconfig=k8-config -- aws s3 ls