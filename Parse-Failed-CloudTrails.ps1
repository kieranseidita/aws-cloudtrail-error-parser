# Get-Content allows us to get the content from our JSON file. This is just a demonstration
# Using the ConvertFrom-Json allows to be able to convert a Json string to a custom object/hash table
# $listTrails = Get-Content .\listtrails.json -Raw | ConvertFrom-Json

# Then we will return it with ConvertTo-Json
# $listTrails | ConvertTo-Json -Depth 4 | Out-File .\listtrails.json


# First part of our code helps us understand how to convert to and from a JSON file

# Now we will learn how to parse a certain amount of our CloudTrail files as opposed to one
# We need the credentials in order to run our CloudTrail files and have access credentials
# $en => means a environment variable, and must use exact key names in order for AWS to work
# Need to set out AWS credentials in order for our access keys to work. do this after setting keys

# Create our function for our Powershell Script

function Parse-Failed-CloudTrails {

Write-Output "Starting to parse your CloudTrail events"

# Displays the max amount of Cloudtrails logs that we want to display
# Make this into your events variable so you can only go through 40 events
# Find-CTEvent is a part of AWS.Tools.CloudTrail module
$events = Find-CTEvent -MaxResult 40 


# Now we must filter through the events to look for any error messages
# Use a for loop to iterate through the logs
# Use $events as your variables for getting events. this is because we are looping through objects

foreach($event in $events){
   if($event.errorMessage){
     Write-Output "Error Found: $($event.errorMessage)"
   }
 }
 Write-Output "Finished parsing your AWS CloudTrail events."
}


#We need to check to see that our AWS credentials are set in environmental variables in order for this code to work
if(-not $env:AWS_ACCESS_KEY_ID  -or -not $env:AWS_SECRET_ACCESS_KEY){
  Write-Warning "AWS credentials are not set. Please set them before running script."
  return
}

#Our environmental variables for AWS Region and for AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY
$env:AWS_REGION = "us-east-2"

Set-AWSCredential -AccessKey $env:AWS_ACCESS_KEY_ID -SecretKey $env:AWS_SECRET_ACCESS_KEY

#AWS needs to specify its default region
Set-DefaultAWSRegion -Region $env:AWS_REGION

#Now we must run our function
Parse-Failed-CloudTrails