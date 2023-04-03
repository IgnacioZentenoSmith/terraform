# Terraform Basic Commands

## Prepare the directory
`mkdir DIRECTORY && cd DIRECTORY && touch main.tf`  
`terraform init`

## Apply the changes
Review the configuration and verify that the resources that Terraform is going to create or update match your expectations  
`terraform plan`  
With file:  
`terraform plan -var-file file.tfvars`  

Apply the Terraform configuration by running the following command and entering yes at the prompt
`terraform apply`


## Reformat
To reformat your Terraform configuration in the standard style, enter the following command:  
`terraform fmt`

## Validate
To check whether your configuration is valid, enter the following command:  
`terraform validate`

## Delete changes
Remove resources previously applied with your Terraform configuration by running the following command and entering yes at the prompt:  
`terraform destroy`

# Global options
Use these before the subcommand, if any:
```
  -chdir=DIR    Switch to a different working directory before executing the given subcommand.
  -help         Show this help output, or the help for a specified subcommand.
  -version      An alias for the "version" subcommand.
```

# All other commands
```
  console       Try Terraform expressions at an interactive command prompt
  fmt           Reformat your configuration in the standard style
  force-unlock  Release a stuck lock on the current workspace
  get           Install or upgrade remote Terraform modules
  graph         Generate a Graphviz graph of the steps in an operation
  import        Associate existing infrastructure with a Terraform resource
  login         Obtain and save credentials for a remote host
  logout        Remove locally-stored credentials for a remote host
  metadata      Metadata related commands
  output        Show output values from your root module
  providers     Show the providers required for this configuration
  refresh       Update the state to match remote systems
  show          Show the current state or a saved plan
  state         Advanced state management
  taint         Mark a resource instance as not fully functional
  untaint       Remove the 'tainted' state from a resource instance
  version       Show the current Terraform version
  workspace     Workspace management
```