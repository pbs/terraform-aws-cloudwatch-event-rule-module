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
