#!/bin/bash
yum install -y httpd awscli
systemctl start httpd
systemctl enable httpd

aws s3 sync s3://${bucket_name} /var/www/html --region us-east-1

echo "<h1>Auto Scaling Web Server</h1>" > /var/www/html/index.html
echo "<h3>Bucket Name: ${bucket_name}</h3>" >> /var/www/html/index.html
echo "<h3>Server Hostname: $(hostname)</h3>" >> /var/www/html/index.html

systemctl restart httpd
