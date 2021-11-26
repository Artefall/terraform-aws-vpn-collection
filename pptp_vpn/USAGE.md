# Usage

<!--- BEGIN_TF_DOCS --->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eip.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_instance.vpn_machine](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_security_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_ami.ubuntu_server_image_latest](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_key"></a> [access\_key](#input\_access\_key) | Cloud access key | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Instance type for server | `string` | `"t2.micro"` | no |
| <a name="input_region"></a> [region](#input\_region) | Place where VPN will be deployed | `string` | `"us-west-1"` | no |
| <a name="input_secret_key"></a> [secret\_key](#input\_secret\_key) | Cloud secret key | `string` | n/a | yes |
| <a name="input_virtual_machine_host_name"></a> [virtual\_machine\_host\_name](#input\_virtual\_machine\_host\_name) | Name of virtual machine instance in cloud | `string` | `"PPTP VPN Host"` | no |
| <a name="input_vpn_client_name"></a> [vpn\_client\_name](#input\_vpn\_client\_name) | Login name of VPN user | `string` | n/a | yes |
| <a name="input_vpn_client_password"></a> [vpn\_client\_password](#input\_vpn\_client\_password) | Password of VPN user | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dns_name"></a> [dns\_name](#output\_dns\_name) | DNS name to connect |
| <a name="output_vpn_ip_address"></a> [vpn\_ip\_address](#output\_vpn\_ip\_address) | IP address of VPN service |

<!--- END_TF_DOCS --->

