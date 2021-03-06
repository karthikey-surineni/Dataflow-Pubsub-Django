locals {
  test_tables = ["ATest","BTest"]
  partition_config = {"ATest"="InsertTimestamp","BTest"="InsertTimestamp"}
}

module "bigquery" {
    source = "./modules/bigquery"
    table_list = local.test_tables
    dataset_id = "DPD_dataset"
    friendly_name = "Dataflow Pubsub Django Test"
    description = "Test dataset"
    location = local.region
    env = terraform.workspace
    partition_config = local.partition_config
}

module "pubsub" {
    source = "./modules/pubsub"
    topic_name = "DPD_topic"
    env = terraform.workspace
}