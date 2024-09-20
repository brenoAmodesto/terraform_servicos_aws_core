# Create a Null Resource and Provisioners
## File Provisioner: Copies the terraform-key.pem file to /tmp/terraform-key.pem
## Remote Exec Provisioner: Using remote-exec provisioner fix the private
## Local Exec provisioner: local-exec provisioner (Creation-Time Provisioner)


resource "null_resource" "name" {

  depends_on = [module.ec2_public]

  connection {
    type        = "ssh"
    host        = aws_eip.bastion_eip.public_ip
    user        = "ec2-user"
    password    = ""
    private_key = file("/home/breno.modesto/Desktop/kalyan_terraform_sre/private-key/terraform-key.pem")

  }
  ## File Provisioner: Copies the terraform-key.pem file to /tmp/terraform-key.pem

  provisioner "file" {
    source      = "private-key/terraform-key.pem"
    destination = "/tmp/terraform-key.pem"

  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 /tmp/terraform-key.pem"
    ]
  }
  ## Local exec provisioner: local-exec provisioner (Creation-Time Provisioner - triggered during Create Resource)
  provisioner "local-exec" {
    command     = "echo VPC created on 'date' and vpc ID: ${module.vpc.vpc_id} >> creation-time-vpc-id.txt"
    working_dir = "local-exec-output-files/"
    #on_failure  = continue
  }
  
  ## Local exec provisioner: local-exec provisioner (Destroy-Time Provisioner - triggered during deletion of Resource)

 /* provisioner "local-exec" {
    command     = "echo Destroy time prov 'date' >> destroy-time-prov.txt"
    working_dir = "local-exec-output-files/"

    when = destroy
  }*/

}

# Creation Time Provisioners - By default they are created during resource creations (terraform apply)
# Creation Time Provisioners - Will be executed during "terraform destroy" command ( when = destroy)