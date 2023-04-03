# Terraform State Handling
Terraform must store state about your managed infrastructure and configuration. This state is used by Terraform to map real world resources to your configuration, keep track of metadata, and to improve performance for large infrastructures  

This state is stored by default in a local file named "terraform.tfstate", but we recommend storing it in Terraform Cloud to version, encrypt, and securely share it with your team  

Terraform uses state to determine which changes to make to your infrastructure. Prior to any operation, Terraform does a refresh to update the state with the real infrastructure  

### Benefits of using cloud to store tf state
1.  availability
2.  easier to manage with a team
3.  centralized IaC

## **Inspection and Modification**
While the format of the state files are just JSON, direct file editing of the state is discouraged. Terraform provides the terraform state command to perform basic modifications of the state using the CLI  

The CLI usage and output of the state commands is structured to be friendly for Unix tools such as grep, awk, etc. Additionally, the CLI insulates users from any format changes within the state itself. The Terraform project will keep the CLI working while the state format underneath it may shift  

Terraform expects a one-to-one mapping between configured resource instances and remote objects. Normally that is guaranteed by Terraform being the one to create each object and record its identity in the state, or to destroy an object and then remove the binding for it  

If you add or remove bindings in the state by other means, such as by importing externally-created objects with terraform import, or by asking Terraform to "forget" an existing object with terraform state rm, you'll then need to ensure for yourself that this one-to-one rule is followed, such as by manually deleting an object that you asked Terraform to "forget", or by re-importing it to bind it to some other resource instance  