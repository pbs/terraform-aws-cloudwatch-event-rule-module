# PBS TF CloudWatch Event Rule Module

## Installation

### Using the Repo Source

Use this URL for the source of the module. See the usage examples below for more details.

```hcl
github.com/pbs/terraform-aws-cloudwatch-event-rule-module?ref=x.y.z
```

### Alternative Installation Methods

More information can be found on these install methods and more in [the documentation here](./docs/general/install).

## Usage

This module provisions a CloudWatch Event Rule. Use this to automate activity in AWS through CloudWatch based on events like CloudTrail events and scheduled events (crons).

Integrate this module like so:

```hcl
module "rule" {
  source = "github.com/pbs/terraform-aws-cloudwatch-event-rule-module?ref=x.y.z"

  event_pattern = <<PATTERN
{
  "source": [
    "aws.ec2"
  ],
  "detail-type": [
    "AWS API Call via CloudTrail"
  ],
  "detail": {
    "eventSource": [
      "ec2.amazonaws.com"
    ],
    "eventName": [
      "DescribeInstances"
    ]
  }
}
PATTERN

  # Tagging Parameters
  organization = var.organization
  environment  = var.environment
  product      = var.product
  repo         = var.repo

  # Optional Parameters
}
```

## Adding This Version of the Module

If this repo is added as a subtree, then the version of the module should be close to the version shown here:

`x.y.z`

Note, however that subtrees can be altered as desired within repositories.

Further documentation on usage can be found [here](./docs).

Below is automatically generated documentation on this Terraform module using [terraform-docs][terraform-docs]

---

[terraform-docs]: https://github.com/terraform-docs/terraform-docs

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.3.2 |
| aws | >= 4.5.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 4.5.0 |

## Modules

No Modules.

## Resources

| Name |
|------|
| [aws_cloudwatch_event_rule](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_rule) |
| [aws_cloudwatch_event_target](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_target) |
| [aws_default_tags](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/default_tags) |
| [aws_lambda_permission](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| environment | Environment (sharedtools, dev, staging, qa, prod) | `string` | n/a | yes |
| event\_pattern | Cloudwatch event pattern | `string` | n/a | yes |
| organization | Organization using this module. Used to prefix tags so that they are easily identified as being from your organization | `string` | n/a | yes |
| product | Tag used to group resources according to product | `string` | n/a | yes |
| repo | Tag used to point to the repo using this module | `string` | n/a | yes |
| description | Description for the Cloud Watch Event Rule | `string` | `null` | no |
| lambda\_permissions | Map of lambda permissions for the CloudWatch event rule. e.g. { "example\_statement\_id\_prefix" = "example\_lambda\_arn" } | `map(any)` | `{}` | no |
| name | Name for the Cloud Watch Event Rule | `string` | `null` | no |
| tags | Extra tags | `map(string)` | `{}` | no |
| targets | Map of targets for the CloudWatch event rule. e.g. { "example\_target\_id" = { arn = "example\_lambda\_arn", role\_arn = "example\_event\_role\_arn" } } | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | ARN of the CloudWatch Event Rule |
