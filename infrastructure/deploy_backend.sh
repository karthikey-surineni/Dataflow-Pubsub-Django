#!/bin/bash
BACKEND_BUCKET="${PROJECT}-backend"
PLAN="${PROJECT}-${ENV}.out"

create_backend(){
    $(gsutil mb -c standard -l australia-southeast1 gs://${BACKEND_BUCKET})
}

# Helper functions
check_backend_exists(){
for item in $(gsutil ls)
do
    if [ $item == "gs://$BACKEND_BUCKET/" ]; then
        found=1
    fi
done

}

check_backend_exists
[ -z $found ] && create_backend; exit 0 || echo "${BACKEND_BUCKET} exists"; exit 0
