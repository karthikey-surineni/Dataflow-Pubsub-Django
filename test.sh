#!/bin/bash
python main.py --dest-dataset=$_TARGETDATASET --table-name=$_TABLENAME --reject-dataset=$_REJECTDATASET --reject-table=$_REJECTTABLE --store-load-type=$_STORELOADTYPE --uid=$_UID \
                   --runner DataflowRunner \
                   --staging_location gs://dataflow-pubsub-django-backend/dataflow/staging \
                   --temp_location gs://dataflow-pubsub-django-backend/dataflow/temp  \
                   --project=dataflow-pubsub-django --region=asia-east1 --zone=australia-southeast1-a \
                   --max_num_workers=2