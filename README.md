# Command Center Scanner IAC #
[Command Center](https://www.critical-sec.com/command-center/) is a full featured vulnerability management platform for penetration testing teams. Command Center Scanner is the client application designed to perform tasks during penetration tests and security audits using
Docker containers. This repository contains packer files and scripts to automate building AMI, VWWare, and KVM images of CCScanner.

## Set your environment variables ##

**_Windows:_**

1) setx AWS_ACCESS_KEY_ID "Your AWS Access Key ID"
2) setx AWS_SECRET_ACCESS_KEY "Your AWS Secret Key"
3) setx AWS_VPC_ID "The AWS VPC ID you are building the AMI in"
4) setx AWS_SUBNET_ID "The AWS Subnet ID you are building the AMI in"
5) setx AWS_INSTANCE_TYPE "The AWS instance type you will be using"
6) setx AWS_REGION "The AWS region to deploy the AMI"

**_MacOS:_**

1) export AWS_ACCESS_KEY_ID="Your AWS Access Key ID"
2) export AWS_SECRET_ACCESS_KEY="Your AWS Secret Key"
3) export AWS_VPC_ID="The AWS VPC ID you are building the AMI in"
4) export AWS_SUBNET_ID="The AWS Subnet ID you are building the AMI in"
5) export AWS_INSTANCE_TYPE="The AWS instance type you will be using"
6) export AWS_REGION="The AWS region to deploy the AMI"

**_Download packer:_**

1) Download the proper Packer binary from https://www.packer.io/downloads.
2) Unzip the package into the `ccscanner-iac` directory.

**_AMI:_**

Your build system must have ssh access to the AMI to run the `provision.sh` script. The `packer-file.json` is configured to use a public address.
If this is unacceptable modify the `packer-file.json` and change `associate_public_ip_address` to `false`.

1) Run the following command - `packer build packer-file-AMI.json`


**_VMWare:_**


1) Run the following command - `packer build packer-file-VMWARE.json`