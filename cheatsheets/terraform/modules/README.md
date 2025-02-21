# Terraform modules 🌸

Terraform modules help you organize and reuse your infrastructure code, making deployments cleaner, more efficient, and scalable. Instead of repeating the same configurations across projects, you can package them into reusable modules.

#  Key benefits of using modules 🌟

✅ **Reusability** – Write once, use everywhere! Define infrastructure components once and reuse them in multiple projects.
✅ **Maintainability** – Keep your Terraform code clean and modular, making it easier to manage and update.
✅ **Scalability** – Quickly adapt your infrastructure for different environments (dev, staging, production).
✅ **Consistency** – Standardize configurations across teams and projects to reduce errors.
✅ **Collaboration** – Break down infrastructure into logical components, making teamwork smoother.


# What you'll find in this cheatsheet

This section provides quick and practical Terraform module examples to help you:

Create and use custom modules
Understand module structure (inputs, outputs, variables)
Work with remote modules (from GitHub, Terraform Registry, etc.)
Manage module versioning and best practices

# Getting started

📂 **main.tf** → The core infrastructure definition
📂 **variables.tf** → Input variables for customization
📂 **outputs.tf** → Outputs to pass values to other modules

## Defining a module

To use a module, you need to structure it like this:

```hcl
module 'my_cute_module' {
  source  = "./modules/cute"
  version = "1.0.0"
  variable_name = "some_value"
  regions = ["eu-west-1", "eu-west-3"]
}
```
## Defining variables

### 1- Define variables in ```variables.tf```

```hcl
variable 'aws_secret_key' {
  description = "Secret AWS key"
  type        = string
  default     = "secret" // optional
}
```



### 2- Passing variables in terraform.tfvars 

Instead of defining variables inline, you can store them in a terraform.tfvars file for dynamic variables:

custom.tfvars
``` hcl
aws_secret_key = "secret_123"
aws_region = ["eu-west-1", "eu-west-3"]
variable_name = "cute"
```

### 3- Apply changes

Then, 
```sh
# apply your changes
terraform apply

# specify a variable file to apply
terraform apply -var-file="custom.tfvars"
```

This will overwrite your variables.tf with your custom.tfvars values
Now your module will look like:

```hcl
module 'my_cute_module' {
  source  = "./modules/cute"
  version = "1.0.0"
  variable_name = var.variable_name
  regions = var.regions
}
```


##  Contribute & Share 🤝

You hve a cool module setup or improvement ? Feel free to contribute! Open an issue or submit a PR. 🚀😊