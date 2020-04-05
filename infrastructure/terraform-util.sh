#!/bin/bash
BACKEND_BUCKET="${PROJECT}-backend"
PLAN="${PROJECT}-${ENV}.out"

echo $BACKEND_BUCKET
echo $PLAN

# Terraform functions
get(){
    terraform get -update=true
}
init(){
    terraform init \
    -backend-config=bucket="${BACKEND_BUCKET}" \
    -reconfigure -get=false;
    terraform workspace new "${ENV}";
    terraform workspace select "${ENV}"
}
plan(){
    terraform plan \
        -out ${PLAN}
}
validate(){
    terraform validate
}
apply(){
    terraform apply ${PLAN}
}

$1