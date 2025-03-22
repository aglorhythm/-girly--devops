# 🌸 Automate file organization with AWS, Terraform & Lambda ✨  

## 💡 Overview  
This project automates file **upload, sorting, and notification** using **AWS S3, Lambda, and Terraform**.  
It helps **busy entrepreneurs** by automatically:  
✔ Uploading files received by email to **AWS S3** 📂  
✔ Organizing them into folders 📑  
✔ Sending notifications when a new file is added 📩  
✔ Notifying users via email or Slack when files are processed 📩  

Let's end **manual uploads, lost files, or messy storage!** 🚀  

---

## ✨ Features  
✔ **Secure Cloud Storage** – Files are uploaded to an encrypted **AWS S3 bucket** 🔐  
✔ **Smart File Sorting** – Documents are automatically **renamed and categorized** 💾  
✔ **AWS Lambda Automation** – Files are processed in **real-time** ⚡
✔ **Automatic File Forwarding** – Files are sent to the right recipient based on type 📨 
✔ **Notification System (Coming Soon)** – Receive an **email or Slack alert** when a file is uploaded 🔔  
✔ **Terraform Deployment** – No manual setup, everything is automated 🏗️  

---

## 🛠️ Tech Stack  
☁️ **Cloud:** AWS (S3, Lambda, IAM)  
🐍 **Programming:** Python
⚙️ **Automation:** Terraform 
📩 **Notifications:** AWS SES (emails), Slack API 
🔐 **Security:** IAM roles & S3 encryption  

---

## 🚀 How to Use  

### 1️⃣ Clone the Repository 💻  
```bash
git clone https://github.com/aglorhythm/-girly--devops.git
cd automated-projects/email-files-management
```

### 2️⃣ Deploy AWS Infrastructure with Terraform (openTofu)  
```bash
tofu init
tofu apply
```

This will create: 
- An AWS S3 bucket for file storage
- An IAM role with proper permissions
- An AWS Lambda function that processes files automatically

### 3️⃣ Upload a File & Let Lambda Handle It   

Upload a file to the S3 bucket and watch it:
✔ Be renamed and categorized automatically
✔ Trigger AWS Lambda to process it in real-time
✔ Sent to the right recipient based on file type 📩
✔ Notify the user via Slack/email

Example:

- Invoices → Sent to accounting@company.com
- Contracts → Sent to legal@company.com
- Bills → Sent to finance@company.com