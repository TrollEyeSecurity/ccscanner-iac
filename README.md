# Command Center Scanner IAC #
[Command Center](https://www.critical-sec.com/command-center/) is a full featured vulnerability management platform for penetration testing teams. Command Center Scanner is the client application designed to perform tasks during penetration tests and security audits using
Docker containers. This repository contains packer files and scripts to automate building AMI, VMware, and KVM images of CCScanner.

## Download Packer and Set your environment variables ##

**_Download packer:_**

1) Download the proper Packer binary from https://www.packer.io/downloads.
2) Unzip the package into the `ccscanner-iac` directory.


**_Windows - Deploy an AMI:_**

1) setx AWS_ACCESS_KEY_ID "Your AWS Access Key ID"
2) setx AWS_SECRET_ACCESS_KEY "Your AWS Secret Key"
3) setx AWS_VPC_ID "The AWS VPC ID you are building the AMI in"
4) setx AWS_SUBNET_ID "The AWS Subnet ID you are building the AMI in"
5) setx AWS_INSTANCE_TYPE "The AWS instance type you will be using"
6) setx AWS_REGION "The AWS region to deploy the AMI"


**_Windows - Deploy a vCenter Template:_**

1) setx VCENTER_SEVER "Your vCenter Server ip or hostname"
2) setx VCENTER_USERNAME "Your vCenter username"
3) setx VCENTER_PASSWORD "Your vCenter password"
4) setx VCENTER_CLUSTER "The cluster to deploy the scanner template in"
5) setx VMWARE_NETWORK "The network to used during the scanner template initial setup"
6) setx DATASTORE "The Datastore to use to store the scanner template"
7) setx ESXI_HOST "The ESXi host to deploy the scanner template on"
8) setx HTTP_SERVER "The HTTP server to seed from"
9) setx HTTP_PORT "The HTTP server port to use"
10) setx STATIC_IP "The static IP address for the scanner template during initial setup"


**_MacOS - Deploy an AMI:_**

1) export AWS_ACCESS_KEY_ID="Your AWS Access Key ID"
2) export AWS_SECRET_ACCESS_KEY="Your AWS Secret Key"
3) export AWS_VPC_ID="The AWS VPC ID you are building the AMI in"
4) export AWS_SUBNET_ID="The AWS Subnet ID you are building the AMI in"
5) export AWS_INSTANCE_TYPE="The AWS instance type you will be using"
6) export AWS_REGION="The AWS region to deploy the AMI"


**_MacOS - Deploy a vCenter Template:_**

1) export VCENTER_SEVER="Your vCenter Server ip or hostname"
2) export VCENTER_USERNAME="Your vCenter username"
3) export VCENTER_PASSWORD="Your vCenter password"
4) export VCENTER_CLUSTER="The cluster to deploy the scanner template in"
5) export VMWARE_NETWORK="The network to used during the scanner template initial setup"
6) export DATASTORE="The Datastore to use to store the scanner template"
7) export ESXI_HOST="The ESXi host to deploy the scanner template on"
8) export HTTP_SERVER="The HTTP server to seed from"
9) export HTTP_PORT="The HTTP server port to use"
10) export STATIC_IP="The static IP address for the scanner template during initial setup"

*_AMI - cmd:_*
1) Run the following command - `packer build packer-file-AMI.json`

*_vCenter - cmd:_*
1) Run the following command - `packer build packer-file-VCENTER.json`

**_AMI Notes:_**

Your build system must have ssh access to the AMI to run the `provision.sh` script. The `packer-file.json` is configured to use a public address.
If this is unacceptable modify the `packer-file.json` and change `associate_public_ip_address` to `false`.

