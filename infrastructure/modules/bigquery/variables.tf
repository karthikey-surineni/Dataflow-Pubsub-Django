variable "dataset_id" {
  type = string
}
variable "friendly_name" {
  type = string
}
variable "description" {
  type = string
}
variable "location" {
  type = string
}
variable "env" {
  type = string
}
variable "table_list" {
  type = list
  default = []
}
variable "partition_config" {
  type = map
  default = {}
}
variable "default_partition_field" {
  type = string
  default = "InsertTimestamp"
}
