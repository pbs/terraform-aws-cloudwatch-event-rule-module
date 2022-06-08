locals {
  name = var.name != null ? var.name : var.product

  description = var.description != null ? var.description : "Cloudwatch event trigger for ${local.name}"

  creator = "terraform"

  tags = merge(
    var.tags,
    {
      Name                                      = local.name
      "${var.organization}:billing:product"     = var.product
      "${var.organization}:billing:environment" = var.environment
      creator                                   = local.creator
      repo                                      = var.repo
    }
  )
}
