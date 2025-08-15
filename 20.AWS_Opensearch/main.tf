resource "aws_opensearch_domain" "nautilus-es" {
  domain_name    = "nautilus-es"
  engine_version = "Elasticsearch_7.10"

  cluster_config {
    instance_type = "r4.large.search"
  }

  tags = {
    Domain = "nautilus-es"
  }
}