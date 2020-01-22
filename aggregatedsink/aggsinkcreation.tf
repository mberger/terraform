# Created with guidance from:  https://www.terraform.io/docs/providers/google/r/logging_organization_sink.html

resource "google_logging_organization_sink" "my-sink" {
  name   = "burwood-com-aggregate-sink"
  org_id = "482676055061"

  # Can export to pubsub, cloud storage, or bigquery
  # storage.googleapis.com/[GCS_BUCKET]
  # bigquery.googleapis.com/projects/[PROJECT_ID]/datasets/[DATASET]
  # pubsub.googleapis.com/projects/[PROJECT_ID]/topics/[TOPIC_ID]

  destination = "bigquery.googleapis.com/projects/burwood-com-aggregate-logs/datasets/burwood_com_aggregate_logs_dataset"

  # Log all WARN or higher severity messages relating to instances (optional)
  #filter = "resource.type = gce_instance AND severity >= WARN"
  
  # If true, logs associated with child projects are also exported otherwise logs relating to the provided organization are included.
  include_children = "true"

}

resource "google_storage_bucket" "log-bucket" {
  name = "organization-logging-bucket"
}

resource "google_project_iam_member" "log-writer" {
  role = "roles/storage.objectCreator"

  member = google_logging_organization_sink.my-sink.writer_identity
}
