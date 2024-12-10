resource "aws_launch_template" "XGmedTokyo_LT" {
  name_prefix   = "XGmedTokyo_LT"
  image_id      = "ami-023ff3d4ab11b2525"  
  instance_type = "t2.micro"

  key_name = "J-Tele-Doctor"

  vpc_security_group_ids = [aws_security_group.XGmedTokyo-sg01-servers.id]

  user_data = base64encode(<<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd

    # Get the IMDSv2 token
    TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

    # Background the curl requests
    curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/local-ipv4 &> /tmp/local_ipv4 &
    curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/placement/availability-zone &> /tmp/az &
    curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/ &> /tmp/macid &
    wait

    macid=$(cat /tmp/macid)
    local_ipv4=$(cat /tmp/local_ipv4)
    az=$(cat /tmp/az)
    vpc=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/$macid/vpc-id)

    # Create HTML file
    cat <<-HTML > /var/www/html/index.html
   <!doctype html>
<html lang=\"en\" class=\"h100\">
<head>
<title>Tokyo Midtown Medical Center</title>
</head>
<body>
<div>
<h1>A Class 6 Site</h1>

<br>

# place the main splash image of medical center and staff

<img src="Tokyo-Med.jpg">

<br>

<h2>Not Feeling Well?...</h2>
<h2>Our Staff Will Nurse You Back To Health in Minut</h2>

<br>

<img src="nurses001.png">

<br>

<h2>Bring A Friend... Or 10!!!</h2>
<h2>Satisfaction Guaranteed</h2>

<br>

<img src="nurses002.png">

<br>

<img src="Bend-Over.jpg">

<br>



</div>
</body>
</html>
HTML

    # Clean up the temp files
    rm -f /tmp/local_ipv4 /tmp/az /tmp/macid
  EOF
  )

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name    = "XGmedTokyo"
      Service = "J-Tele-Doctor"
      Owner   = "Tokyo Midtown Medical Center"
      Goal    = "Leave_Matrix"
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}
