# pre-commit + Terraform specific plugins

## What's that repo for?

This repo is just a sample configuration for [pre-commit](https://pre-commit.com).

It is configured with the following plugins:

- trailing-whitespace (from defaut pre-commit repo)
- terraform-validate (from [gruntwork](https://gruntwork.io/) repo)
- terraform_docs and terraform-fmt (from [Anton Babenko](https://github.com/antonbabenko) repo)

This configuration make sure that code in this repo:

- is correctly formatted : `terraform fmt`should pass successfully,
- has passed `terraform validate`, ruling-out basic typos and syntax errors,
- have an up-to-date documentation regarding requirements, providers, variables and outputs.

## Table of Contents

1. [Usage](#usage)
2. [Requirements](#requirements)
3. [Providers](#Providers)
4. [Inputs](#inputs)
5. [Outputs](#outputs)

## Usage

1. Install the bits: `brew install pre-commit terraform-docs` (MacOS example with [Brew](https://brew.sh/), see [pre-commit documentation](https://pre-commit.com/#install) for other platforms)
2. put the pre-commit config file in the root of your git repo. It should be named `.pre-commit-config.yaml`
3. initialize pre-commit (each time you change the `.pre-commit-config.yaml` file): `pre-commit install`
4. commit your code as usual

Optionally, before trying to commit, you can run pre-commit to see if there is any problem with your code: (all the hooks will be ran anyway when you `git commit` if the pre-commit hooks have been installed as suggeted in step #3).

The code snippet below show you how to run your hooks manually and the output when eveyrthing is ok.

```shell
❯ pre-commit run -a
Trim Trailing Whitespace.................................................Passed
Terraform validate.......................................................Passed
Terraform fmt............................................................Passed
Terraform docs...........................................................Passed
```

If any step fails, the hook will try to fix your files:

- Git will stop before commit until all hooks pass successfully
- you will have to stage files fixed by pre-commit to the Git Index again (e.g. `git add .`)
- and finally run your `git commit` command again

Below is the auto-generated Terraform configuration documentation using [terraform-docs](https://github.com/terraform-docs/terraform-docs), added to this README file.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.14 |
| oci | >=4.0.0 |

## Providers

| Name | Version |
|------|---------|
| oci | >=4.0.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| compartment\_ids | n/a | `map(any)` | `null` | no |
| fingerprint | n/a | `string` | `null` | no |
| private\_key | n/a | `string` | `null` | no |
| private\_key\_path | n/a | `string` | `null` | no |
| region | n/a | `string` | `null` | no |
| tenancy\_ocid | n/a | `string` | `null` | no |
| user\_ocid | n/a | `string` | `null` | no |
| vcn\_cidr | n/a | `string` | `"172.16.0.0/24"` | no |
| vcn\_cidrs | n/a | `list(any)` | <pre>[<br>  "10.0.0.0/16",<br>  "172.16.0.0/16",<br>  "192.168.0.0/16"<br>]</pre> | no |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
