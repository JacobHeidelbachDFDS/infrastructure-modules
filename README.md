[![Build Status](https://dev.azure.com/dfds/DevelopmentExcellence/_apis/build/status/Infrastructure-Modules%20QA?branchName=master)](https://dev.azure.com/dfds/DevelopmentExcellence/_build/latest?definitionId=1656&branchName=master)

# infrastructure-modules

Terraform modules for infrastructure

Containers to run this: https://hub.docker.com/u/dfdsdk

## Terraform Best Practices

### Terraform Files

- main.tf
- outputs.tf
- vars.tf

### Terraform Module Folder Structure

We recommend a folder structure for Terraform modules like so:

```
module-category
 └ module-name
    └ README.md
    └ main.tf
    └ outputs.tf
    └ vars.tf
```

Example:
```
security
 └ iam-account-alias
    └ README.md
    └ main.tf
    └ outputs.tf
    └ vars.tf
 └ org-account
    └ README.md
    └ main.tf
    └ outputs.tf
    └ vars.tf
network
 └ ...
```

### Credits

The general structure of these modules, file layout etc. are largely based on Gruntwork's recommendations. More specifically the blog posts:

* [Gruntwork blog: How to manage Terraform state](https://blog.gruntwork.io/how-to-manage-terraform-state-28f5697e68fa)
* [Gruntwork blog: How to create reusable infrastructure with Terraform modules](https://blog.gruntwork.io/how-to-create-reusable-infrastructure-with-terraform-modules-25526d65f73d)
* [Gruntwork blog: How to use Terraform as a team](https://blog.gruntwork.io/how-to-use-terraform-as-a-team-251bc1104973)

Gruntwork's example repos, of both modules and live/input data, along with their README files have also proven very useful:

* [Github: gruntwork-io/terragrunt-infrastructure-live-example](https://github.com/gruntwork-io/terragrunt-infrastructure-live-example)
* [Github: gruntwork-io/terragrunt-infrastructure-modules-example](https://github.com/gruntwork-io/terragrunt-infrastructure-modules-example)

To workaround some of Terraform's quirks and shortcomings:

* [Gruntwork blog: Terraform tips & tricks: loops, if-statements, and gotchas](https://blog.gruntwork.io/terraform-tips-tricks-loops-if-statements-and-gotchas-f739bbae55f9)

Other inspiration:

* https://www.ybrikman.com/writing/2017/10/13/reusable-composable-battle-tested-terraform-modules/
