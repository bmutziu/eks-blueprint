#!/bin/bash

sed -e '/workloads/ s/^#*/#/' -i 3-gitops.tf

terraform apply -auto-approve

terraform destroy -target=module.kubernetes_addons -auto-approve

terraform destroy --target data.kubectl_path_documents.karpenter_provisioners -auto-approve

terraform destroy -target=module.eks_blueprints -auto-approve

terraform destroy -target=module.vpc -auto-approve

sed -i '23,24 s/^/#/' 1-eks.tf

terraform state list

terraform destroy -auto-approve

sed -i "23,24 s/# */  /" 1-eks.tf

terraform state list

sed -i '/workloads/s/^#//g' 3-gitops.tf

rm ./4-karpenter.tf
