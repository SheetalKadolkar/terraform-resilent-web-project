🚀 **Auto Scaling Web Application using Terraform (AWS)**

## 📌 Project Overview

- This project demonstrates how to provision and manage a **highly available, auto-scaling web application** on AWS using **Terraform**.
- The infrastructure automatically **scales EC2 instances based on CPU utilization**, ensuring high performance during peak traffic and cost efficiency during low usage.
- The project is deployed entirely in **AWS us-east-1** and follows **Infrastructure as Code (IaC)** best practices.

---

## 🏗️ Architecture & Technologies Used

This project uses **Terraform** to provision a scalable AWS infrastructure in **us-east-1**, consisting of:

- VPC with public subnets  
- Application Load Balancer (ALB) to distribute traffic  
- Auto Scaling Group (ASG) with scaling policies  
- Launch Template for EC2 configuration  
- EC2 instances (Amazon Linux 2) for hosting the application  
- CloudWatch Alarms for CPU-based scaling decisions  
- S3 bucket for static content storage  
- IAM roles and security groups for secure access control  
- Terraform & VS Code for Infrastructure as Code and development  

---

## 📂 Project Structure

TERRAFORM-RESILIENT-WEB-PROJECT
├── autoscaling.tf
├── elb.tf
├── iam.tf
├── index.html
├── launch_template.tf
├── LICENSE
├── outputs.tf
├── provider.tf
├── README.md
├── s3.tf
├── security.tf
├── userdata.tpl
├── variables.tf
├── vpc.tf

📊 Monitoring

-CloudWatch Alarms monitor EC2 CPU usage
-Auto Scaling Group Activity logs scaling events
-ALB distributes traffic across instances

🧠 What I Learned

-Implementing Auto Scaling with Terraform
-Using CloudWatch alarms for scaling decisions
-Understanding burstable EC2 instances and CPU credits
-Debugging real-world scaling issues
-Writing reusable and modular Terraform code
-Managing AWS infrastructure using IaC best practices

🎯 Real-World Use Case

-This setup simulates a production-ready web application that:
-Automatically handles traffic spikes
-Minimizes costs during low usage
-Requires minimal manual intervention
