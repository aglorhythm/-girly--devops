# 💰 Auto backup & cost saver – AWS S3 + Glacier + cost optimization ✨  

## 💡 Overview  
This project automates **file backups** to AWS **while optimizing cloud storage costs**.  
It helps **entrepreneurs & small businesses** store important files **securely & affordably** over the long term.  

🚀 **What it does:**  
✔ **Automates file backups to AWS S3** 📂  
✔ **Moves older files to Glacier for cost savings** ❄️  
✔ **Tracks AWS storage costs over time** 📊  
✔ **Generates cost reports (Google Sheets or email)** 📩  

## ✨ Features  
✔ **Low-cost long-term storage** with AWS S3 + Glacier 💰  
✔ **Automatic backup scheduling** (via AWS Lambda) ⚡  
✔ **Lifecycle rules to move old files to cheaper storage** 📉  
✔ **AWS Cost Explorer API integration** for cost tracking 📊  
✔ **Google Sheets or email reports for cost transparency** 📩  

---

## 🛠️ Tech Stack  
☁️ **Cloud:** AWS (S3, Glacier, Lambda, IAM, Cost Explorer API)  
🐍 **Programming:** Python 
⚙️ **Automation:** Terraform 
📊 **Reporting:** Google Sheets API / AWS SES (email reports)  

---

## 🚀 How to Use  

### 1️⃣ Clone the repository 💻  
```bash
git clone https://github.com/aglorhythm/girly--devops.git
cd automated-projects/auto-backup-cost-saver
```

### 2️⃣ Deploy AWS infrastructure with Terraform (openTofu)  
```bash
tofu init
tofu apply
```

This will create: 
- An AWS S3 bucket with lifecycle policies for cost optimization
- An IAM role with permissions for Lambda & Cost Explorer API
- AWS Lambda functions to automate backups & generate reports

### 3️⃣ Automate file backups & cost tracking

- Upload files to the S3 bucket
- Lambda automatically moves older files to Glacier
- A scheduled Lambda function tracks monthly/yearly AWS costs
- Cost report is sent via email or added to Google Sheets