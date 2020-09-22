# Purpose
This module enforces a stardand naming and tagging convention for resources. The requirements are:

* The delimiter is `-`.
* All names are in the format `<env>-<name>-<suffix>`.
* The name contains only alphanumeric characters and dashes.
* All outputs are lowercase except tags can have uppercase values.
* Includes the tags `Managed By: Terraform`, `Name: <name>`, `Environment: <env>` at a minimum.

## Restrictions

* Do not use for SSM parameters. See [ssm label](../ssm/README.md).

## Examples

```hcl
module "label" {
  source = "https://github.com/Clean-Terraform/terraform-modules//generic/labels/standard"
  name   = "app"
  env    = terraform.workspace
}

resource "aws_dynamodb_table" {
  name = module.label.outputs.id
  tags = module.label.outputs.tags
  ...
}
```

## Docs
See [TF_DOCS.md](./TF_DOCS.md)

