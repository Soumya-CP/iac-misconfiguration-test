# IaC Misconfiguration Test Corpus

Purpose: exercise **25 intentionally insecure Infrastructure-as-Code rules** across Terraform, Bicep, ARM, CloudFormation, Kubernetes YAML, Docker Compose, and Dockerfiles.

All values are synthetic. These files are static fixtures only; do not deploy them. Some resources intentionally describe public access, weak network boundaries, or elevated container privileges so a scanner can detect them.

## Layout

- `terraform/` — AWS and Azure Terraform fixtures
- `bicep/` — Azure Bicep fixtures
- `arm/` — Azure ARM JSON fixtures
- `cloudformation/` — AWS CloudFormation fixtures
- `kubernetes/` — Kubernetes manifests
- `docker/` — Compose and Dockerfile fixtures
- `rules.json` — exact 25-rule test catalog
- `expected-findings.csv` — expected rule IDs, paths, and marker lines

## Testing

Scan all files recursively and compare reported rule IDs to `expected-findings.csv`. Check resource-level context (for example, that a permissive ingress rule is attached to a security group or network security group). Avoid flagging safe examples in comments or unrelated string literals.

**Safety:** Do not run `terraform apply`, deploy templates, apply Kubernetes manifests, or build/publish these Docker images.
