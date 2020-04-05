resource "google_pubsub_topic" "topic" {
  name = var.topic_name

  labels = {
    env = var.env
  }
}