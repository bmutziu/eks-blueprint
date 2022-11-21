#!/bin/bash

terraform plan -out tfplan
terraform apply tfplan

cp /../karpenter/4-karpenter.tf .

terraform apply -auto-approve
