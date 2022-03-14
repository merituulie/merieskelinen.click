locals {
  s3_origin_id = "${var.domain}-s3-origin"

    tags = {
        created_by = "terraform"
        s3_origin_id = "${var.domain}-s3-origin"
    }
}