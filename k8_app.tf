
resource "local_file" "k8s_app" {
  filename = "${var.prefix}_${var.aws}-app-k8s.yaml"
  content  = <<APP
apiVersion: v1
kind: ServiceAccount
metadata:
  name: app
  namespace: default
  annotations:
    eks.amazonaws.com/role-arn: ${aws_iam_role.eks-app-WebIdentity.arn}
---
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: test
  name: test
spec:
  serviceAccountName: app
  containers:
  - command: ["sleep","6000"]
    image: amazon/aws-cli
    name: test
    resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Always
status: {}

APP
}



resource "null_resource" "apply_k8_app" {
  depends_on = [
    local_file.k8s_app,
    null_resource.cube_config
  ]
  provisioner "local-exec" {
    interpreter = ["/bin/bash", "-c"]
    when        = create
    command     = <<EOF

kubectl apply -f ${local_file.k8s_app.filename} --kubeconfig=${local_file.kubeconfig.filename}
EOF

  }
}

