
data "aws_region" "current" {}

data "external" "inspector_exists" {
  program = [
    "sh",
    "${path.module}/scripts/check_inspector.sh",
    "${data.aws_region.current.name}"
  ]
}
