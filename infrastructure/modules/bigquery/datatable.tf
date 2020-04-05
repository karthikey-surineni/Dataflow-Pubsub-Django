resource "google_bigquery_table" "datatable" {
  for_each = toset(var.table_list)
  dataset_id = google_bigquery_dataset.dataset.dataset_id
  table_id   = each.key

  time_partitioning {
    type = "DAY"
    field = lookup(var.partition_config,each.key,"InsertTimestamp")
  }

  labels = {
    env = var.env

  schema = file("${path.cwd}/schema/${each.key}.json")
}
}