# Variable Definition Precedence
The above mechanisms for setting variables can be used together in any combination. If the same variable is assigned multiple values, Terraform uses the last value it finds, overriding any previous values. Note that the same variable cannot be assigned multiple values within a single source.  

Terraform loads variables in the following order, with later sources taking precedence over earlier ones:  

1. Environment variables
2. The terraform.tfvars file, if present.
3. The terraform.tfvars.json file, if present.
4. Any *.auto.tfvars or *.auto.tfvars.json files, processed in lexical order of their filenames.
5. Any -var and -var-file options on the command line, in the order they are provided (This includes variables set by a Terraform Cloud workspace).

# Input Variables in Terraform

## **Variables in the CLI**
To specify individual variables on the command line, use the -var option when running the terraform plan and terraform apply commands:

###### example: 
`terraform apply -var="image_id=ami-abc123"`  
`terraform apply -var='image_id_list=["ami-abc123","ami-def456"]' -var="instance_type=t2.micro"`  
`terraform apply -var='image_id_map={"us-east-1":"ami-abc123","us-east-2":"ami-def456"}'`  


## **Variable definition file**
To set lots of variables, it is more convenient to specify their values in a variable definitions file (with a filename ending in either .tfvars or .tfvars.json) and then specify that file on the command line with -var-file:

###### example: 
`$ terraform apply -var-file="test.tfvars"`


## **Envs in Terraform**
As a fallback for the other ways of defining variables, Terraform searches the environment of its own process for environment variables named TF_VAR_ followed by the name of a declared variable.

This can be useful when running Terraform in automation, or when running a sequence of Terraform commands in succession with the same variables. For example, at a bash prompt on a Unix system:

## **Constant Variables**
Defined in .auto.tfvars

###### example:
`$ export TF_VAR_image_id=ami-abc123`  
`$ terraform plan`

# Output Variables in Terraform
Output values make information about your infrastructure available on the command line, and can expose information for other Terraform configurations to use. Output values are similar to return values in programming languages.

- A child module can use outputs to expose a subset of its resource attributes to a parent module  
- A root module can use outputs to print certain values in the CLI output after running terraform apply  
- When using remote state, root module outputs can be accessed by other configurations via a terraform_remote_state data source 

**Outputs are only rendered when Terraform applies your plan. Running terraform plan will not render outputs.**

## **Output Value Documentation -- description**
Because the output values of a module are part of its user interface, you can briefly describe the purpose of each value using the optional description argument  

The description should concisely explain the purpose of the output and what kind of value is expected. This description string might be included in documentation about the module, and so it should be written from the perspective of the user of the module rather than its maintainer. For commentary for module maintainers, use comments  

## **Suppressing Values in CLI Output -- sensitive**
Terraform will hide values marked as sensitive in the messages from terraform plan and terraform apply. In the following scenario, our root module has an output declared as sensitive and a module call with a sensitive output, which we then use in a resource attribute.  

Terraform will still record sensitive values in the state, and so anyone who can access the state data will have access to the sensitive values in cleartext.  

## **Explicit Output Dependencies -- depends_on**
Since output values are just a means for passing data out of a module, it is usually not necessary to worry about their relationships with other nodes in the dependency graph.  

However, when a parent module accesses an output value exported by one of its child modules, the dependencies of that output value allow Terraform to correctly determine the dependencies between resources defined in different modules.  

Just as with resource dependencies, Terraform analyzes the value expression for an output value and automatically determines a set of dependencies, but in less-common cases there are dependencies that cannot be recognized implicitly. In these rare cases, the depends_on argument can be used to create additional explicit dependencies  

The depends_on argument should be used only as a last resort. When using it, always include a comment explaining why it is being used, to help future maintainers understand the purpose of the additional dependency.  