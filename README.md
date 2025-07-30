# ACA Environment Provisioning

This repository contains:

1. **Terraform module** under `modules/aca_environment` for creating an Azure Container App Environment and a Log Analytics Workspace.
2. **GitOps configuration** files in `configs` generated after each successful provisioning run.
3. **GitHub workflow** in `.github/workflows/provision.yml` that provisions environments using Terraform and reports progress back to [Port](https://docs.port.io) using the `port-github-action`. The workflow authenticates to Azure using OpenID Connect (OIDC).

The workflow is triggered manually (or by Port) with the desired environment name, region and a three letter environment code.  After Terraform successfully applies, the workflow writes a YAML file describing the new environment into `configs/` and commits it back to the `main` branch.
