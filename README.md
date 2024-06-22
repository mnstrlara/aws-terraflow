# Automated Terraform IaC Deployment on AWS with CI/CD Integration
## Objective:
The objective of AWS Terraflow is to automate and streamline the deployment of infrastructure as code using Terraform on AWS, utilizing AWS CodePipeline and CodeBuild for continuous integration and deployment (CI/CD).
## Components:
### 1. IAM Role
Used to grant permissions for CodePipeline, CodeBuild, and other AWS services to interact securely with resources.
### 2. KMS Key
Ensures encryption of sensitive data used within the pipeline, such as credentials or configuration files.
### 3. S3 Bucket
Acts as a storage repository for artifacts generated during the CI/CD process, including Terraform configuration files and deployment packages.
### 4. CodeCommit
 Hosts the source code repository containing Terraform configuration files, enabling version control and collaboration.
### 5. CodeBuild
Executes build tasks defined in the buildspec.yml file, such as compiling code, running tests, and packaging artifacts.
### 6. CodePipeline 
Orchestrates the CI/CD workflow, automating the integration, testing, and deployment of changes to infrastructure as code.
### 7. Terraform
Provides the framework for defining and provisioning AWS infrastructure as code, ensuring consistent and repeatable deployments.

## Pre-requisites:
- AWS Root account created and available
- AWS CLI installed on local machine
- Terraform installed on local machine

## .tfvars Configuration:
`.tfvars` files in Terraform are used to supply input variables to your Terraform configurations. They allow you to parameterize your infrastructure code, making it flexible and reusable across different environments or configurations.

Example:
```
project_name               = "your-project-name"
source_repository_name     = "your-repository-name"
repo_default_branch        = "your-default-branch"
```

> **NOTE: See the end of the README.md file for the documentation on how to correctly configure a .tfvars file**

## Steps:
### 1. Assume Proper Role
Before deploying the Terraform files to AWS, ensure you have assumed the appropriate IAM role with the necessary permissions. Follow these steps:

- Open the AWS Management Console and navigate to the IAM Service
- In the IAM dashboard, select "Roles" from the left-hand menu
- Search for and select the IAM role that has the required permissions for deploying Terraform infrastructure.
- After finding the role you will be using, return to the AWS CLI and apply the assume role command, it should look something like this:

```
aws sts assume-role --role-arn "arn:aws:iam::123456789012:role role-name" --role-session-name your-session
```

- The AWS CLI will give you credentials which you will apply using these commands:

```
export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
export AWS_SESSION_TOKEN=
```
 - Your role should now be assumed but in case you want to double check, use this command that will give you the credentials of the role you are currently using:

```
aws sts get-caller-identity
```

### 2. Deployment
To deploy your infrastructure using Terraform, follow these steps:

- **Initialize Terraform** using `terraform init`. It initializes a Terraform working directory by downloading and installing any required plugins defined in your configuration files (.tf files).

- **Validate Terraform Configuration** using `terraform validate`. This validates the syntax and configuration of your Terraform files. (This is an optional step)

- **Plan Terraform Changes** using `terraform plan`. It generates an execution plan for Terraform, showing the actions it will take to achieve the desired state defined in your configuration.

- **Apply Terraform Changes** using `terraform apply`. This executes the planned changes to create, modify, or delete infrastructure resources as defined in your Terraform configuration.

> **NOTE: If you are using a .tfvars file, make sure to add it to your `terraform apply` command using -var-file="./path/to/.tfvars**

### 3. Branch creation
After running the `terraform apply` command, you should be receiving a confirmation regarding the deployment. If you go check out the pipeline in the AWS Console you will receive an error from CodeCommit telling you that the branch you gave it does not exist. This is because new repositories are not created with their default branch. This is where you have to create a branch using the following steps:

- There are three ways to create a branch in the CodeCommit repository - through the **AWS Console**, through the **AWS CLI** and creating a branch **locally**. I will be giving an example on how you can do it locally.
- Firstly, go to the AWS Console and copy the CodeCommit pipeline URL, you will use this URL to clone the repository using `git clone`.
- Next, you will use the `cd` command to go inside the directory, where you will do the following line execution:

```bash
$>echo 'hello world' > touch.txt
$>git add touch.txt
$>git commit -a -m "init master"
$>git push -u origin master
```

- This will initialize the repository and officialy start running your pipeline.

## Documentation
#### [AWS CLI install and update instructions](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) - This topic describes how to install or update the latest release of the AWS Command Line Interface (AWS CLI) on supported operating systems
#### [Terraform installation](https://developer.hashicorp.com/terraform/install) - This link leads to a Terraform installation
#### [Protect sensitive input variables](https://developer.hashicorp.com/terraform/tutorials/configuration-language/sensitive-variables) - Topic describing the importance of .tfvars files and how to configue them
#### [Create a branch in AWS CodeCommit](https://docs.aws.amazon.com/codecommit/latest/userguide/how-to-create-branch.html) - Topics on the three different ways to create a branch in AWS CodeCommit

## License
This library is licensed under the MIT-0 License. See the LICENSE file.