# Terraform Module Name: terraform-module-aws-network


## General

This module may be used to create **_VPC and other resources_** in AWS cloud provider..

---


## Prerequisites

This module needs Terraform 0.12.16 or newer.
You can download the latest Terraform version from [here](https://www.terraform.io/downloads.html).

This module deploys aws services details are in respective feature branches.

---

## Features Branches

Below we are able to check the resources that are being created as part of this module call:


- **_VPC and other resources_** *(Terraform 12 supported code)*


---

## Below are the resources that are launched by this module

- **_VPC_**
- **_Internet Gatway_**
- **_Subnets_**
- **_Route Tables_**
- **_Route Tables Rules_**
- **_DHCP Option_**
- **_Nat Gateway_**



---

## Usage

## Using this repo

To use this module, add the following call to your code:

```tf
module "<layer>-network-<AccountID>" {
  source = "git::https://github.com/nitinda/terraform-module-aws-network.git?ref=terraform-12/master"

  providers = {
    aws = aws.services
  }

  cidr_block           = "10.30.0.0/16"
  enable_dns_hostnames = true

  # Subnet
  public_subnets_cidr  = ["10.30.1.0/24", "10.30.2.0/24"]
  private_subnets_cidr = ["10.30.3.0/24", "10.30.4.0/24"]
  db_subnets_cidr      = ["10.30.5.0/24", "10.30.6.0/24"]
  availability_zones   = ["eu-central-1a", "eu-central-1b"]

  # DHCP
  domain_name         = "eu-central-1.compute.internal"
  domain_name_servers = ["AmazonProvidedDNS"]

  # Tags
  common_tags = var.common_tags
  tag_name_prefix = "ec2-monitoring"

}
```
---

## Inputs

The variables required in order for the module to be successfully called from the deployment repository are the following:


|**_Variable_** | **_Description_** | **_Type_** | **_Argument Status_** |
|:----|:----|-----:|-----:|
| **_domain\_name\_servers_** | List of name servers to configure in /etc/resolv.conf | _list(string)_ | **_Required_** |
| **_domain\_name_** | The suffix domain name to use by default when resolving non Fully Qualified Domain Names | _string_ | **_Required_** |
| **_cidr\_block_** | The CIDR block for the VPC | _string_ | **_Required_** |
| **_enable\_dns\_hostnames_** | A boolean flag to enable/disable DNS hostnames in the VPC. | _string_ | **_Required_** |
| **_public\_subnets\_cidr_** | The CIDR block for the subnet | _list(string)_ | **_Required_** |
| **_private\_subnets\_cidr_** | The CIDR block for the subnet | _list(string)_ | **_Required_** |
| **_db\_subnets\_cidr_** | The CIDR block for the subnet | _list(string)_ | **_Required_** |
| **_availability\_zones_** | The AZ for the subnet | _list(string)_ | **_Required_** |
| **_common\_tags_** | Resources Tags | _map(string)_ | **_Required_** |
| **_tag\_name\_prefix_** | Resources Name Tag prefix | _string_ | **_Required_** |




## Outputs

- **_VPC_**
- **_Internet Gatway_**
- **_Subnets_**
- **_Route Tables_**
- **_Route Tables Rules_**
- **_DHCP Option_**
- **_Nat Gateway_**




### Usage
In order for the variables to be accessed on module level please use the syntax below:

```tf
module.<module_name>.<output_variable_name>
```

If an output variable needs to be exposed on root level in order to be accessed through terraform state file follow the steps below:

- Include the syntax above in the network layer output terraform file.
- Add the code snippet below to the variables/global_variables file.

```tf
data "terraform_remote_state" "<module_name>" {
  backend = "s3"

  config {
    bucket = <bucket_name> (i.e. "s3-webstack-terraform-state")
    key    = <state_file_relative_path> (i.e. "env:/${terraform.workspace}/4_Networking/terraform.tfstate")
    region = <bucket_region> (i.e. "eu-central-1")
  }
}
```

- The output variable is able to be accessed through terraform state file using the syntax below:

```tf
"${data.terraform_remote_state.<module_name>.<output_variable_name>}"
```

## Authors
Module maintained by Module maintained by the - **_Nitin Das_**
