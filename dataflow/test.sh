#!/bin/bash
# gcloud auth activate-service-account --key-file=../dataflow-pubsub-django-f64b5bb7d05c.json;
# pip install -r requiremepip nts.txt
# python3 --version;
python3 main.py \
        --project=dataflow-pubsub-django \
        --input_topic=projects/dataflow-pubsub-django/topics/DPD_topic \
        --window_size=2 \
        --dest_table=dataflow-pubsub-django:DPD_dataset.ATest \
        --runner=DataflowRunner \
        --temp_location=gs://dataflow-pubsub-django-backend/dataflow/temp

    #    --region=asia-east1 \
        # --zone=australia-southeast1-a \
    #    --staging_location=gs://dataflow-pubsub-django-backend/dataflow/staging \
    #    --max_num_workers=2