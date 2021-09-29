# random_pet

Terraform works with resources and an easy way to label them is to use random_pet to generate the names.

Provider documentation: [LINK](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet)

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

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply"
now.
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

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

random_pet.dog: Creating...
random_pet.dog: Creation complete after 0s [id=Mr_useful_boxer]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
$
```
