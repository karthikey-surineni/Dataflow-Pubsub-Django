resource "google_bigquery_table" "default" {
  for_each = toset(var.table_list)
  dataset_id = google_bigquery_dataset.default.dataset_id
  table_id   = var.table_id

  time_partitioning {
    type = "DAY"
    field = lookup(var.partition_config,each.key,"InsertTimestamp")
  }

  labels = {
    env = google_bigquery_dataset.default.env
  }

  schema = file("${path.cwd}/schema/${each.key}.json")
}