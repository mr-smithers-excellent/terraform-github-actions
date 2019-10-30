# Fork of Terraform GitHub Actions

This is a fork of the [official Terraform GitHub Actions repo](https://github.com/hashicorp/terraform-github-actions) that installs tooling on the Docker images utilized for Terraform operations.

## Additional Tooling

* [Google Cloud SDK](https://cloud.google.com/sdk/gcloud/)
* [Helm](https://helm.sh/)
* jq
* bind-tools
* [BATS](https://github.com/bats-core/bats-core)

## Actions

### Fmt Action
Runs `terraform fmt` and comments back if any files are not formatted correctly.
<img src="./assets/fmt.png" alt="Terraform Fmt Action" width="80%" />

### Validate Action
Runs `terraform validate` and comments back on error.
<img src="./assets/validate.png" alt="Terraform Validate Action" width="80%" />

### Plan Action
Runs `terraform plan` and comments back with the output.
<img src="./assets/plan.png" alt="Terraform Plan Action" width="80%" />

### Apply Action
Runs `terraform apply` and comments back with the output.
<img src="./assets/apply.png" alt="Terraform Apply Action" width="80%" />
