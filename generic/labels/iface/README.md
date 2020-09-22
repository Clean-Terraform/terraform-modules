# Purpose
Defines the interface for a label

## Requirements
* Must have `id` and `tags` key
* Tags must have `Name`, `Environment`, and `ManagedBy` keys

## Descriptions
- id: Standardized name to use for resources
- Name tag: equal to the id
- Environment Tag: used to differentiate between environments
- ManagedBy: used to indicate the resource is being managed by Terraform
