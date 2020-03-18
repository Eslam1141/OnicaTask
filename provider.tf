resource "aws_key_pair" "terrademo" {
  key_name   = "terrademo"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDMnrYih5LSufgP5h02vOZnxvEgCfeIvfjDrZcbhFjvKcOzGP4e/A9935iV9vIG3G+2du5p63qre8dw46l8Uerls127HBvj2Xmh5UXZuUkG6TiNm1ncwmsGAmlo7AomiaKe0X3e+AzJGO4e7fhYQpCnPYwEYKtl85tFVsIbHXTODa9Oi+A75DaUemyxRLZ+RLT27IAw2TntBh6bfsly00fOibbVcGDrFyR2VN/49Mc8dtlNukmyhvXMadTDoZd25Z5NEqDGXhnu5uYug9hpGVqRslcxh9JvPw+vCG86fP9tc312aXT6LSSh8SwDmgNXpp8pg0SH04/8G9aY7KvToHjR eslam@AWS-RS-US-QA-ELK"
}

provider "aws" {
    region = "us-east-2"
    access_key = "AKIA2YVYJAFVAJTGL4KL"
    secret_key = "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"
}

