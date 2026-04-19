# 🚀 Terraform AWS VPC Setup

This project provisions a Virtual Private Cloud (VPC) on **Amazon Web Services (AWS)** using Terraform. It uses the official VPC module to create a scalable and production-ready network infrastructure.

---

## 📌 Features

* Create a custom VPC
* Configure public subnet
* Use modular Terraform structure
* Easily extendable for private subnets, NAT Gateway, etc.
* Follows Infrastructure as Code (IaC) best practices

---

## 🏗️ Architecture Overview

* VPC CIDR: `10.0.0.0/16`
* Public Subnet: `10.0.1.0/24`
* Availability Zone: `eu-north-1a`

---

## 🛠️ Technologies Used

* Terraform
* AWS (Amazon Web Services)

---

## 📂 Project Structure

```
.
├── main.tf          # Main Terraform configuration
├── variables.tf     # Input variables (optional)
├── outputs.tf       # Output values (optional)
└── README.md        # Project documentation
```

---

## ⚙️ Prerequisites

Make sure you have:

* Terraform installed (>= 1.x)
* AWS CLI configured
* AWS account with proper IAM permissions

---

## 🔐 AWS Configuration

⚠️ **Do NOT hardcode credentials in code**

Use AWS CLI:

```
aws configure
```

Or environment variables:

```
export AWS_ACCESS_KEY_ID=your_access_key
export AWS_SECRET_ACCESS_KEY=your_secret_key
```

---

## 🚀 Usage

### 1️⃣ Initialize Terraform

```
terraform init
```

### 2️⃣ Validate Configuration

```
terraform validate
```

### 3️⃣ Plan Infrastructure

```
terraform plan
```

### 4️⃣ Apply Changes

```
terraform apply
```

---

## 🧹 Destroy Infrastructure

To delete all created resources:

```
terraform destroy
```

---

## 📦 Module Used

* terraform-aws-modules/vpc/aws

---

## ⚠️ Important Notes

* Use valid private CIDR ranges (e.g., `10.0.0.0/16`)
* Avoid exposing AWS credentials
* Ensure CIDR blocks do not overlap with existing networks

---

## 🔮 Future Enhancements

* Add private subnets
* Configure NAT Gateway
* Setup Internet Gateway
* Implement Security Groups
* Add EC2 instances or Load Balancer

---

## 👨‍💻 Author

Siddharth Lowanshi

---

## 📄 License

This project is open-source and available under the MIT License.
