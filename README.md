# End to End Azure Terraform Demo

The Infrastructure as Code in this repository will bootstrap the following
resources for you:

- Azure Resources (ARM)
- Azure Active Directory Groups
- Service Principals
- Azure DevOps Projects (including Service Connections, Security Group Assignments, etc.)

## Active Directory Groups

The key to end to end governance is to have *multiple* role assignments (with different role definitions and different resource scopes to the same Azure AD groups) as illustrated below.

To understand the benefits, imagine if you had to remove a contractor after completion of a project. If you use the concept described in this project and in the accompanying [official Microsoft documentation](https://aka.ms/architecture-e2e-governance), you can remove their access from multiple environments and resources simply by removing their membership to AAD group(s).

![](https://raw.githubusercontent.com/Azure/devops-governance/main/images/2021-06-role-assignments.svg)

Note: the `-all` groups are currently not in use but was introduced to address a conceptual problem (see [#12](https://github.com/Azure/devops-governance/issues/12)):

- Azure Resource Manager uses an [*additive* permissions](https://docs.microsoft.com/en-us/azure/role-based-access-control/overview#multiple-role-assignments) model
- Azure DevOps uses a [*least* permissions](https://docs.microsoft.com/en-us/azure/devops/organizations/security/about-permissions?view=azure-devops&tabs=preview-page) model

| Group Name       | ARM Role    | Azure DevOps Role      |
| ---------------- | ----------- | ---------------------- |
| `app-all`        | -           | -                      |
| `app-devs`       | Contributor | Contributor            |
| `app-admins`     | Owner       | Project Administrators |
| `api-all`        | -           | -                      |
| `api-devs`       | Contributor | Contributor            |
| `api-admins`     | Owner       | Project Administrators |
| `infra-all`      | -           | -                      |
| `infra-devs`     | Contributor | Contributor            |
| `infra-admins`   | Owner       | Project Administrators |

## Azure DevOps Projects


