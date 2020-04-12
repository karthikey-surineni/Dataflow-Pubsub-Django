from dataflow.core import SchemaLoader
from dataflow.core import pubsub_bigquery_process
import argparse
import datetime
import json
import logging

import apache_beam as beam
import apache_beam.transforms.window as window
from apache_beam.options.pipeline_options import PipelineOptions

if __name__ == "__main__":  # noqa
    logging.getLogger().setLevel(logging.INFO)
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--input_topic",
        help="The Cloud Pub/Sub topic to read from.\n"
        '"projects/<PROJECT_NAME>/topics/<TOPIC_NAME>".',
    )
    parser.add_argument(
        "--window_size",
        type=float,
        default=1.0,
        help="Output file's window size in number of minutes.",
    )
    parser.add_argument(
        "--dest_table",
        help="Output BigQuery table for results specified as: PROJECT:DATASET.TABLE or DATASET.TABLE.",
    )
    known_args, pipeline_args = parser.parse_known_args()
    pubsub_bigquery_process.run(
        known_args.input_topic,
        known_args.dest_table,
        SchemaLoader(known_args.dest_table),
        known_args.window_size,
        pipeline_args,
    )