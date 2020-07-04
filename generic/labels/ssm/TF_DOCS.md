## Requirements

No requirements.

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| env | Environment, e.g. 'prod', 'staging', 'dev'. | `string` | n/a | yes |
| key | The secret key name, e.g. mysql\_password. | `string` | n/a | yes |
| name | Solution name, e.g. `user-service` or `jenkins`. | `string` | n/a | yes |
| tags | Additional tags, e.g. `{team = "foo"}`. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| outputs | [Label Interface](https://github.com/Clean-Terraform/terraform-modules/tree/master/generic/labels/base/interface/README.md) |

