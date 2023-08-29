# Command Center Scanner IAC #
[Command Center](https://www.critical-sec.com/command-center/) is a full featured vulnerability management platform for penetration testing teams. Command Center Scanner is the client application designed to perform tasks during penetration tests and security audits using
Docker containers. This repository contains packer files and scripts to automate building AMI, Azure, and VMware images of CCScanner.

# Step 1 ) #

## Download Packer and Set your environment variables ##

**_Download packer:_**

1) Download the proper Packer binary from https://www.packer.io/downloads.
2) Unzip the package into the `ccscanner-iac` directory.


## On Windows OS ##
 
*_Set variables for the AMI:_*

1) setx AWS_ACCESS_KEY_ID "Your AWS Access Key ID"
2) setx AWS_SECRET_ACCESS_KEY "Your AWS Secret Key"
3) setx AWS_VPC_ID "The AWS VPC ID you are building the AMI in"
4) setx AWS_SUBNET_ID "The AWS Subnet ID you are building the AMI in"
5) setx AWS_INSTANCE_TYPE "The AWS instance type you will be using"
6) setx AWS_REGION "The AWS region to deploy the AMI"

*_Set variables for the AZURE Image:_*

1) setx AZURE_CLIENT_ID "Your Azure client id"
2) setx AZURE_CLIENT_SECRET "Your Azure client secret"
3) setx AZURE_SUBSCRIPTION_ID "Your Azure subscription id"
4) setx AZURE_TENANT_ID "Your Azure tenant id"
5) setx AZURE_LOCATION "The Azure location to keep the image"
6) setx AZURE_VM_SIZE "The default VM size"
7) setx AZURE_RESOURCE_GROUP_NAME "The Azure resource group name"

*_Set variables for the vCenter Template:_*

1) setx VCENTER_SEVER "Your vCenter Server ip or hostname"
2) setx VCENTER_USERNAME "Your vCenter username"
3) setx VCENTER_PASSWORD "Your vCenter password"
4) setx VCENTER_CLUSTER "The cluster to deploy the scanner template in"
5) setx VMWARE_NETWORK "The network to used during the scanner template initial setup"
6) setx DATASTORE "The Datastore to use to store the scanner template"
7) setx ESXI_HOST "The ESXi host to deploy the scanner template on"
8) setx HTTP_SERVER "The HTTP server to seed from"
9) setx HTTP_PORT "The HTTP server port to use"


## On macOS or Linux ##

*_Set variables for the AMI:_*

1) export AWS_ACCESS_KEY_ID="Your AWS Access Key ID"
2) export AWS_SECRET_ACCESS_KEY="Your AWS Secret Key"
3) export AWS_VPC_ID="The AWS VPC ID you are building the AMI in"
4) export AWS_SUBNET_ID="The AWS Subnet ID you are building the AMI in"
5) export AWS_INSTANCE_TYPE="The AWS instance type you will be using"
6) export AWS_REGION="The AWS region to deploy the AMI"

*_Set variables for the AZURE Image:_*

1) export AZURE_CLIENT_ID="Your Azure client id"
2) export AZURE_CLIENT_SECRET="Your Azure client secret"
3) export AZURE_SUBSCRIPTION_ID="Your Azure subscription id"
4) export AZURE_TENANT_ID="Your Azure tenant id"
5) export AZURE_LOCATION="The Azure location to keep the image"
6) export AZURE_VM_SIZE="The default VM size"
7) export AZURE_RESOURCE_GROUP_NAME="The Azure resource group name"

*_Set variables for the vCenter Template:_*

1) export VCENTER_SEVER="Your vCenter Server ip or hostname"
2) export VCENTER_USERNAME="Your vCenter username"
3) export VCENTER_PASSWORD="Your vCenter password"
4) export VCENTER_CLUSTER="The cluster to deploy the scanner template in"
5) export VMWARE_NETWORK="The network to used during the scanner template initial setup"
6) export DATASTORE="The Datastore to use to store the scanner template"
7) export ESXI_HOST="The ESXi host to deploy the scanner template on"
8) export HTTP_SERVER="The HTTP server to seed from"
9) export HTTP_PORT="The HTTP server port to use"

# Step 2 ) #

## Executing the packer file: ##

*_To build the AMI:_*
Run the following command - `packer build scanner/packer-file-AMI.json`

*_To build the vCenter Template:_*
Run the following command - `packer build scanner/packer-file-VCENTER.json`

*_To build the AZURE Image:_*
Run the following command - `packer build scanner/packer-file-AZURE.json`

**_AMI Notes:_**

Your build system must have ssh access to the AMI to run the `provision.sh` script. The `packer-file.json` is configured to use a public address.
If this is unacceptable please modify the `packer-file.json` and change `associate_public_ip_address` to `false`.

**_Referances:_**
https://docs.microsoft.com/en-us/azure/virtual-machines/linux/build-image-with-packer#define-packer-template

# Step 3 ) #

Now you have a template to use to deploy the CCScaner image.