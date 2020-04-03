#!/bin/bash
# PROJECT=$(gcloud config get-value project)
# ENV="dev"
BACKEND_BUCKET="${PROJECT}-backend"
PLAN="${PROJECT}-${ENV}.out"

echo $BACKEND_BUCKET

# Helper functions
check_backend_exists(){
for item in $(gsutil ls)
do
    if [ $item == "gs://$BACKEND_BUCKET/" ]; then
        found=1
    fi
done
}
create_backend(){
    $(gsutil mb -c standard -l australia-southeast1 gs://${BACKEND_BUCKET})
}
configure_backend(){
    terraform init \
    -backend-config=bucket="${BACKEND_BUCKET}" \
    -reconfigure -get=false;
    terraform workspace new "${ENV}";
    terraform workspace select "${ENV}"
}

# Terraform functions
get(){
    terraform get -update=true
}
init(){
    check_backend_exists
    [ -z $found ] && create_backend; configure_backend || configure_backend
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