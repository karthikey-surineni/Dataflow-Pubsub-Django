resource "google_bigquery_table" "datatable" {
  for_each = toset(var.table_list)
  dataset_id = google_bigquery_dataset.dataset.dataset_id
  table_id   = each.key
  time_partitioning {
    type = "DAY"
    field = lookup(var.partition_config,each.key,var.default_partition_field)
  }
  labels = {
    env = var.env
  }
  schema = file("${path.cwd}/modules/bigquery/schema/${each.key}.json")
}
