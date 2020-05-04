# Purpose
This module enforces a stardand naming and tagging convention for all of your resources. The following conditions are enforced:

* The delimiter between words is `-`
* All names are in the format `<env>-<name>-<suffix>`
* All names are lowercase
* Tags include a key-value pair of `Managed By: Terraform`

## Requirements

No requirements.

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| env | Environment, e.g. 'prod', 'staging', 'dev' | `string` | n/a | yes |
| name | Solution name, e.g. `user-service` or `jenkins` | `string` | n/a | yes |
| suffix | Additional attributes to add to the name. | `string` | `""` | no |
| tags | Additional tags (e.g. `map('BusinessUnit','XYZ')` | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| env | Normalized Environment |
| id | Disambiguated ID |
| name | Normalized name |
| tags | Normalized Tag map |


## Examples

Applying the below configuration in the `prod` Terraform Workspace the DynamoDB Table name will be `prod-app`.

```hcl
module "label" {
  source = "https://github.com/Clean-Terraform/terraform-modules//generic/label"
  name   = "app"
  env    = terraform.workspace
}

resource "aws_dynamodb_table" {
  name = module.label.id
  tags = module.label.tags

  ...
}
```

