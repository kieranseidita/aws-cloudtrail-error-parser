# 🔍 AWS CloudTrail Error Parser

This PowerShell script automates scanning AWS CloudTrail logs to identify events containing error messages. It helps with early detection of failed API calls and debugging misconfigurations in your AWS environment.

---

## 🧠 What This Script Does

- Parses up to **40 CloudTrail events** using the AWS.Tools.CloudTrail PowerShell module  
- Searches for and outputs any events containing an `errorMessage` field  
- Sets AWS credentials and region via environment variables for security and automation  
- Demonstrates reading and writing JSON files in PowerShell (optional demo code)

---

## 💻 Skills Demonstrated

- PowerShell scripting  
- AWS CLI and CloudTrail usage  
- JSON parsing and log automation  
- Error detection in cloud infrastructure  
- Environment variable management  
- Debugging and tool integration  

---

## 📁 How It Works (High-Level)

1. **Credential Setup**  
   Checks that `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` environment variables are set, and sets the AWS region (`us-east-2` by default).

2. **CloudTrail Event Parsing**  
   Uses `Find-CTEvent` from the `AWS.Tools.CloudTrail` module to retrieve up to 40 events.

3. **Error Detection**  
   Iterates through events and outputs any containing an `errorMessage`.

4. **Optional JSON File Reading (Demo)**  
   Includes commented-out example code demonstrating how to load and save JSON with `Get-Content`, `ConvertFrom-Json`, and `ConvertTo-Json`.

---

## 🔧 Requirements

- AWS account with CloudTrail enabled  
- PowerShell 5.1+ or PowerShell Core  
- [AWS.Tools.CloudTrail](https://www.powershellgallery.com/packages/AWS.Tools.CloudTrail) module  
  (Install using `Install-Module AWS.Tools.CloudTrail`)  
- Environment variables set before running:  
  - `AWS_ACCESS_KEY_ID`  
  - `AWS_SECRET_ACCESS_KEY`  
  - *(Optional)* `AWS_REGION`

---

## 🚀 Running the Script

```powershell
# Set AWS credentials securely
$env:AWS_ACCESS_KEY_ID = "<your_access_key>"
$env:AWS_SECRET_ACCESS_KEY = "<your_secret_key>"
$env:AWS_REGION = "us-east-2"

# Run the script
.\parse-cloudtrail-errors.ps1
