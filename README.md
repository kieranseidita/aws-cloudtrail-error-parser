# 🔍 AWS CloudTrail Error Parser

This PowerShell script automates the process of scanning AWS CloudTrail logs and identifying events that contain error messages. It's a useful tool for early detection of failed API calls and debugging misconfigurations in your AWS environment.

---

## 🧠 What This Script Does

- Parses up to **40 CloudTrail events** using the AWS.Tools.CloudTrail PowerShell module.
- Searches for and prints any events with an `errorMessage` field.
- Sets up AWS credentials and region using environment variables for security and automation.
- Demonstrates how to read/write JSON files in PowerShell.

---

## 💻 Skills Demonstrated

- PowerShell scripting  
- AWS CLI and CloudTrail  
- JSON parsing and log automation  
- Error detection in cloud infrastructure  
- Environment variable management  
- Debugging and tool integration

---

## 📁 How It Works (High-Level)

1. **Credential Setup**  
   The script checks that your `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` are properly set as environment variables. It also defines your AWS region (`us-east-2` by default).

2. **CloudTrail Event Parsing**  
   It uses `Find-CTEvent` from the `AWS.Tools.CloudTrail` module to fetch up to 40 events.

3. **Error Detection**  
   The script loops through these events and outputs any that contain an `errorMessage`.

4. **Optional JSON File Reading (Demo)**  
   Example code (commented out) shows how to load and save JSON using `Get-Content`, `ConvertFrom-Json`, and `ConvertTo-Json`.

---

## 🔧 Requirements

- AWS account with CloudTrail enabled
- PowerShell 5.1+ or PowerShell Core
- [AWS.Tools.CloudTrail](https://www.powershellgallery.com/packages/AWS.Tools.CloudTrail) module  
  (Install using `Install-Module AWS.Tools.CloudTrail`)
- Set the following environment variables before running:
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
