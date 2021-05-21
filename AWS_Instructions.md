Create an AWS Account:
Go to https://aws.amazon.com/ click Create an AWS Account
Follow the prompts to create an account.

Select Location:
Select the location where you want your server from the drop down menu to the left of Support in the top right of the screen. Use https://www.cloudping.info/ to determine the location with the lowest (best)  latency. If you have multiple users whose latency you care about, have them all share the results of https://www.cloudping.info/ with you for you to find the one with the best balance for everyone concerned. 

Launch a Linux Server:
Got to Services, Compute, EC2, Launch Instance, Launch Instance

Step 1: Choose an Amazon Machine Image (AMI):
Select the latest LTS version of Ubuntu Server, currently:
Ubuntu Server 20.04 LTS (HVM), SSD Volume Type
Select 64-bit (x86)

Step 2: Choose an Instance Type:
Select the m5zn.xlarge instance with the amount of memory required. I use m5zn.xlarge.
Note: I chose m5zn.xlarge as it is the instance type with the fastest CPU cores and it has 16GiB RAM, if you select an instance with less memory you will have to alter the parameters in the services and scripts accordingly, the ones that require alteration will be noted. Cheaper instances may suffice.

Step 3: Configure Instance Details:
Leave the defaults in place

Step 4: Add Storage:
Leave the defaults in place, we will change these later.

Step 5: Add Tags:
Leave this as default.

Step 6: Configure Security Group
Here we will create a new security group, this is much like port forwarding on a router.
Type: SSH
Protocol: TCP
Port Range: 22
Source: My IP

Add Rule
Type: Custom TCP Rule
Protocol: TCP
Port Range: 25565
Source: Anywhere

Ignore the warning that says:
Rules with source of 0.0.0.0/0 allow all IP addresses to access your instance. We recommend setting security group rules to allow access from known IP addresses only.

Step 7: Review Instance Launch
Press Launch
Create a key pair
Name it
Download it

Leave this page open then proceed to the next step. Note that some steps cannot be completed until you launch your instance.

Prepare to Connect to Your Server Using SSH by following the instructions here:
https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/putty.html 

Once preparations are complete, return to the previous page that you left open. 

Note that after the next click you will be using services that cost money, in order to reduce costs I recommend reading through and making sure you understand the rest of the documentation before launching your instance. If you get confused and need to stop to get help, I recommend right clicking your instance and clicking terminate, this will require a restart of much of the process but you will probably save money in the end.

Click Launch Instances

Connect to Your Server Using SSH:
https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/putty.html 

Follow the instructions in the rest of the documentation for installing Minecraft and its related services and mods.

On the instances page of AWS.
Right click your instance
Click images and templates
Click create image
Give your image a Name
Click Create Image
On the left side of your screen, under images, click AMIs.
Once the Status of your image changes from pending to available switch over to Instances
Right click your instance and click terminate.

Under Instances Click Launch Templates, Create launch template.

Under: Launch template name - required type a name for your template.
Under: Launch template contents > Amazon machine image (AMI) > AMI
Search for your AMI by its name and select it.
Instance type:
Select the same instance type we used earlier.
Key pair (login):
Select the Key pair that you used to launch your instance, it should be the only one available.
Network settings > Security groups:
Select the security group you created earlier.
Storage (volumes):
Select Volume 1 (AMI Root) and modify it for your needs.
Size (GiB): 16
Volume type: General purpose SSD (gp3)
IOPS: 8000
Delete on termination: Yes
Throughput: 1000
These values have not been optimized, lower values may perform well. Delete on termination should be set to no if you require logs and world files from servers that you do not use in the actual run.

Advanced details:
Shutdown behavior: Stop

Click: Create launch template

How to launch:
From the EC2 Dashboard click Launch Instance > Launch Instance From Template
Under Source template select the template we created.
Select the number of instances you want
Scroll down and click launch instance from template
Return to the EC2 Dashboard
Click Instances
Here you will find a list of your running instances, the Public IPv4 address lists the IP you put into a minecraft client to connect.

Read the how to roll seeds documentation for information on how to use the scripts and services that we have created. 

Once you have a seed, select the servers without the seed right click, and click terminate.

