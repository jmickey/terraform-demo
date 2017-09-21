# Terraform Demo Code

## 1-example-simple
* Showcase a simple single folder config, without the utilisation of modules.
* Uses separate `.tfvar` files to control different environments.
* This way of structuring terraform confirms allows users to get started with terraform quickly.
* However, it also increases risk of environments being accidently deleted or altered.
* As the configuration grows, it will begin to become difficult to manage using this structure.

## 2-example-modules
* Showcases a terraform configuration that utilises modules, and a separate folder (and `.tfstate` file) for each environment.
* Not as quick to setup.
* Reduces the risk of altering or destroying environments accidently.
* Promotes code reuse and consistency between environments.
* Modules are declared independantly, making the configuration as a whole easier to manage, and slowing the growth of complexity.
