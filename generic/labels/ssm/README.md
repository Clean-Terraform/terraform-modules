# Purpose
This module enforces a stardand naming and tagging convention for SSM parameters. The requirements are:

* The delimiter is `/`.
* All names are in the format `<env>/<name>/<key>`.
* The name contains only alphanumeric characters and slashes.
* All outputs are lowercase except tags can have uppercase values.
* Default tags `Managed By: Terraform`, `Name: <name>`, `Environment: <env>`.

## Restrictions

* Only use for SSM parameters. For other resources See [standard label](../standard/README.md).

## Examples

```hcl
module "ssm_label" {
  source = "https://github.com/Clean-Terraform/terraform-modules//generic/labels/ssm"
  name   = "app"
  env    = terraform.workspace
  key    = "mysql_password"
}

resource "aws_ssm_parameter" "mysql_password" {
  name  = "module.ssm_label.id
  type  = "SecureString"
  value = "secret"
  tags  = module.ssm_label.tags
}
```

## Docs
See [TF_DOCS.md](./TF_DOCS.md)

