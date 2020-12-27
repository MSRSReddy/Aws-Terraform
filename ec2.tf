resource "aws_instance" "web-1" {
    count = "${var.environment == "Prod" ? 3 : 1 }"
    ami = "${lookup(var.amis, var.aws_region)}"
    instance_type = "${var.instance_type}"
    key_name = "${var.key_name}"
    subnet_id = "${element(aws_subnet.public-subnets.*.id,count.index)}"
    vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]
    associate_public_ip_address = true
    user_data = <<-EOF
		#! /bin/bash
        sudo yum update -y
		sudo yum install -y nginx 
        sudo service nginx start
		echo "<h1>${var.vpc_name}-Public-Server-${count.index+1}</h1>" >> /usr/share/nginx/html/index.html
		#echo "${var.vpc_name}-Public-Server-${count.index+1}" | sudo tee /usr/share/nginx/html/index.html
	EOF	
    tags = {
        Name = "${var.vpc_name}-Public-Server-${count.index+1}"
        Env = "${var.environment}"
        Owner = "Sree"
	    CostCenter = "ABCD"
    }
}