# ASSIGNING MULTILINE VALUES TO A VARIABLE

variable "my_script" {
  default = <<EOT
#!/bin/bash
sudo apt update
sudo apt install -y nginx
EOT
}


# STORING SENSITIVE DATA IN VARIABLE

variable "db_password" {
  type      = string
  sensitive = true
}

# MAP TYPE VARIABLE
# Map helps define key-value pairs for complex configurations.

variable "instance_ami_map" {
  type = map(string)
  default = {
    us-east-1 = "ami-1234abcd"
    us-west-1 = "ami-abcd1234"
  }
}



