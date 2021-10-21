# random_pet

Terraform works with resources. \
Resource names can be easily generated with the random_pet provider (module) that terraform core can use.

Provider documentation: [LINK](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet)

# How to use this code:
Download the repository
```
git clone https://github.com/ion-training/terraform-random_pet.git
```

Change directory into the newly downloaded repo
```
cd terraform-random_pet
```

Initialize the terraform workspace, terraform core will download the module random
```
terraform init
```

Check the plan terraform prepared for applying the changes
```
terraform plan
```
Apply the changes (create the resources, the random names)
```
terraform apply
```

To destroy the resources used, use destroy option
```
terraform destroy
```

# Example: 
No arguments are needed by default:
```
resource "random_pet" "cat" {
}
```

With parameters to customize the strings generated:
```
resource "random_pet" "dog" {
  prefix = "Mr"
  separator = "_"
  length = 2
}
```

# Sample Output
Init, plan, apply on main.tf [LINK](https://github.com/ion-training/terraform-random_pet/blob/main/main.tf)
```
$ terraform init

Initializing the backend...

Initializing provider plugins...
- Finding latest version of hashicorp/random...
- Installing hashicorp/random v3.1.0...
- Installed hashicorp/random v3.1.0 (signed by HashiCorp)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
$
```

```
$ terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # random_pet.dog will be created
  + resource "random_pet" "dog" {
      + id        = (known after apply)
      + length    = 2
      + prefix    = "Mr"
      + separator = "_"
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + dog = (known after apply)

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.
$
```

```
$ terraform apply

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # random_pet.dog will be created
  + resource "random_pet" "dog" {
      + id        = (known after apply)
      + length    = 2
      + prefix    = "Mr"
      + separator = "_"
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + dog = (known after apply)

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

random_pet.dog: Creating...
random_pet.dog: Creation complete after 0s [id=Mr_dear_stingray]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

Outputs:

dog = "Mr_dear_stingray"
$
```

Destroying the resources generated
```
$ terraform destroy
andom_pet.dog: Refreshing state... [id=Mr_dear_stingray]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # random_pet.dog will be destroyed
  - resource "random_pet" "dog" {
      - id        = "Mr_dear_stingray" -> null
      - length    = 2 -> null
      - prefix    = "Mr" -> null
      - separator = "_" -> null
    }

Plan: 0 to add, 0 to change, 1 to destroy.

Changes to Outputs:
  - dog = "Mr_dear_stingray" -> null

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

random_pet.dog: Destroying... [id=Mr_dear_stingray]
random_pet.dog: Destruction complete after 0s

Destroy complete! Resources: 1 destroyed.
$
```
