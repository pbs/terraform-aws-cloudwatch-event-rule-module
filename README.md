# PBS TF CloudWatch Event Rule Module

## Installation

### Using the Repo Source

```hcl
module "cloudwatch-event-rule" {
    source = "github.com/pbs/terraform-aws-cloudwatch-event-rule-module?ref=0.0.2"
}
```

### Alternative Installation Methods

More information can be found on these install methods and more in [the documentation here](./docs/general/install).

## Usage

This module provisions a CloudWatch Event Rule. Use this to automate activity in AWS through CloudWatch based on events like CloudTrail events and scheduled events (crons).

Integrate this module like so:

```hcl
module "cloudwatch-event-rule" {
  source = "github.com/pbs/terraform-aws-cloudwatch-event-rule-module?ref=0.0.2"

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

`0.0.2`

Note, however that subtrees can be altered as desired within repositories.

Further documentation on usage can be found [here](./docs).

Below is automatically generated documentation on this Terraform module using [terraform-docs][terraform-docs]

---

[terraform-docs]: https://github.com/terraform-docs/terraform-docs

## Requirements

| Name                                                                     | Version  |
| ------------------------------------------------------------------------ | -------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.1.7 |
| <a name="requirement_aws"></a> [aws](#requirement_aws)                   | >= 4.5.0 |

## Providers

| Name                                             | Version |
| ------------------------------------------------ | ------- |
| <a name="provider_aws"></a> [aws](#provider_aws) | 4.5.0   |

## Modules

No modules.

## Resources

| Name                                                                                                                                            | Type     |
| ----------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| [aws_cloudwatch_event_rule.event_rule](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_rule)       | resource |
| [aws_cloudwatch_event_target.event_target](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_target) | resource |
| [aws_lambda_permission.allow_event_invocation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission)   | resource |

## Inputs

| Name                                                                                    | Description                                                                                                                                      | Type          | Default | Required |
| --------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------ | ------------- | ------- | :------: |
| <a name="input_environment"></a> [environment](#input_environment)                      | Environment (sharedtools, dev, staging, prod)                                                                                                    | `string`      | n/a     |   yes    |
| <a name="input_event_pattern"></a> [event_pattern](#input_event_pattern)                | Cloudwatch event pattern                                                                                                                         | `string`      | n/a     |   yes    |
| <a name="input_organization"></a> [organization](#input_organization)                   | Organization using this module. Used to prefix tags so that they are easily identified as being from your organization                           | `string`      | n/a     |   yes    |
| <a name="input_product"></a> [product](#input_product)                                  | Tag used to group resources according to product                                                                                                 | `string`      | n/a     |   yes    |
| <a name="input_repo"></a> [repo](#input_repo)                                           | Tag used to point to the repo using this module                                                                                                  | `string`      | n/a     |   yes    |
| <a name="input_description"></a> [description](#input_description)                      | Description for the Cloud Watch Event Rule                                                                                                       | `string`      | `null`  |    no    |
| <a name="input_lambda_permissions"></a> [lambda_permissions](#input_lambda_permissions) | Map of lambda permissions for the CloudWatch event rule. e.g. { "example_statement_id_prefix" = "example_lambda_arn" }                           | `map(any)`    | `{}`    |    no    |
| <a name="input_name"></a> [name](#input_name)                                           | Name for the Cloud Watch Event Rule                                                                                                              | `string`      | `null`  |    no    |
| <a name="input_tags"></a> [tags](#input_tags)                                           | Extra tags                                                                                                                                       | `map(string)` | `{}`    |    no    |
| <a name="input_targets"></a> [targets](#input_targets)                                  | Map of targets for the CloudWatch event rule. e.g. { "example_target_id" = { arn = "example_lambda_arn", role_arn = "example_event_role_arn" } } | `map(any)`    | `{}`    |    no    |

## Outputs

| Name                                         | Description                      |
| -------------------------------------------- | -------------------------------- |
| <a name="output_arn"></a> [arn](#output_arn) | ARN of the CloudWatch Event Rule |
