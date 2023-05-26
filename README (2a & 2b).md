# Part 2: Creating VMs, Infra as a Code (IaC)
## 1.0 Creating VPC:
Now according to the project requirement, we will be creating a new VPC in which we will assign or manage our instances or objects. The figure below shows the range of IPs we get for CIDR (10.0.0.0/28).
 
 ![image](https://github.com/nab1999/project1_part2/assets/126570628/99887593-72cb-4eed-a0b7-3ec1289c8eb8)

Creating IPv4 CIDR of 10.0.0.0/28 for our new VPC (Nabeel_VPC). We have decided to go with this CIDR because based on our project requirement we will have 2 total main hosts (client & server). Moreover, as we will have 1 subnet based on our requirement, 5 IPs will be reserved by AWS. And the rest of remaining IPs will be kept or can be used later for future when instances auto-scale or increases, and it can also later be utilized when we need more subnets.

![image](https://github.com/nab1999/project1_part2/assets/126570628/46b1214d-4f6f-42d3-9bed-a56dda7d9e8d)

New VPC (Nabeel_VPC) successfully created:

![image](https://github.com/nab1999/project1_part2/assets/126570628/91027454-6b06-4335-bbc6-99e7deee71ae)

## 1.1 Creating Subnet:
Now we will create a subnet (Nabeel_sb1) in US-East-1a availability zone. The IPv4 CIDR block for this subnet is 10.0.0.0/28 (which means total 16 hosts / IPs in this subnet).

![image](https://github.com/nab1999/project1_part2/assets/126570628/82b34a5b-9c72-45fa-bd4a-ea1284c1f7f9)

## 1.2 Auto-assign IP setting for subnets:
Now we will enable Auto-assign public IPv4 address for subnet (Nabeel_sb1) which will automatically assign public IPs when instances are created under this subnet.

![image](https://github.com/nab1999/project1_part2/assets/126570628/0d7893c0-3046-455e-94e9-96967075b9d7)

## 1.3 Creating Internet Gateway:
Internet Gateway (Nabeel-igw) was created so that our VPC (Nabeel_VPC) can be connected to the internet.

![image](https://github.com/nab1999/project1_part2/assets/126570628/4633340b-5d97-4d8f-8f7e-3affdb6e47db)

Attaching Internet Gateway with VPC (Nabeel_VPC).

![image](https://github.com/nab1999/project1_part2/assets/126570628/961d48bc-e09d-4128-a618-bae75d7d861a)

## 1.4 Creating Route Table:
Creating Route table (Nabeel-rt) in order to specify how packets are forwarded between the subnets within our created VPC (Nabeel_VPC) and the internet.

![image](https://github.com/nab1999/project1_part2/assets/126570628/b7c4f77d-6beb-4305-b944-5eca30933248)

Route Table (Nabeel-rt) successfully created.

![image](https://github.com/nab1999/project1_part2/assets/126570628/585b052a-176e-4168-9762-30e066df3b3e)

Associating the created route table (Nabeel-rt) with Nabeel-sb1.

![image](https://github.com/nab1999/project1_part2/assets/126570628/eab6ec28-76e5-4aa4-b72c-2ef3acf9853b)

Adding route to routing table so that all traffic will be allowed to access through internet gateway.

![image](https://github.com/nab1999/project1_part2/assets/126570628/4bed141d-deb5-4372-bf95-832e193310d1)

## 1.5 Creating EC2 instances:
### 1.5.1 Server Instance:

![image](https://github.com/nab1999/project1_part2/assets/126570628/554744ca-529f-4070-a204-eab4771ba2aa)

![image](https://github.com/nab1999/project1_part2/assets/126570628/cde7b3a7-e1bd-4ec8-aa3f-28e26735bfe3)

![image](https://github.com/nab1999/project1_part2/assets/126570628/68887265-7161-4192-b1b6-2cfb9cf60051)

![image](https://github.com/nab1999/project1_part2/assets/126570628/460e9431-fd97-485b-a8cf-be4c806346d1)

![image](https://github.com/nab1999/project1_part2/assets/126570628/3280a68e-e8b9-487e-b1a4-26e7887cc03c)

![image](https://github.com/nab1999/project1_part2/assets/126570628/c2df8bef-1772-45fc-b8ca-2607fe7de35b)

![image](https://github.com/nab1999/project1_part2/assets/126570628/c5906490-c35f-4724-bb57-614d08091e7e)

### 1.5.2 Client Instance:

![image](https://github.com/nab1999/project1_part2/assets/126570628/becdce60-8061-4f4a-bef1-7f3b7631cf7f)

![image](https://github.com/nab1999/project1_part2/assets/126570628/031e687f-a68d-4053-a07c-91f3100beba9)

![image](https://github.com/nab1999/project1_part2/assets/126570628/f88eab47-c995-4664-8d0e-67df39b0f9ee)

![image](https://github.com/nab1999/project1_part2/assets/126570628/e298b2a5-6441-4d7b-b6e2-284814aeb7e4)

![image](https://github.com/nab1999/project1_part2/assets/126570628/0e78affc-2cad-43f2-af72-48a07ab7814a)

![image](https://github.com/nab1999/project1_part2/assets/126570628/0c69e792-48c0-497e-a95b-4bb771678b7f)

![image](https://github.com/nab1999/project1_part2/assets/126570628/3a5f79c0-fb9f-4b92-80d5-47f754a21771)

## 1.6 Connecting instances using putty software:
Connecting to EC2 instances (Nabeel_EC2_server01 & Nabeel_EC2_client) through SSH protocol by using putty software/client. After connecting to EC2 instances, we will get the latest bug fixes and security updates by updating the software on our EC2 instances using the command: “sudo yum update -y”.
EC2 Instance (Nabeel_EC2_server01):

![image](https://github.com/nab1999/project1_part2/assets/126570628/0173907d-e3b2-4840-9e4d-4860b18201c0)

EC2 Instance (Nabeel_EC2_client01):

![image](https://github.com/nab1999/project1_part2/assets/126570628/32bb44d5-643a-4918-b1c4-000d539bfb11)

### 1.6.1 Checking the connectivity between both instances:
Pinging from server instance (ip:10.0.0.8) to client instance (ip:10.0.0.12):

![image](https://github.com/nab1999/project1_part2/assets/126570628/dab7480e-b44f-4eae-bb9b-678e8696ce3b)

Pinging from client instance (ip:10.0.0.12) to server instance (ip:10.0.0.8):

![image](https://github.com/nab1999/project1_part2/assets/126570628/8f2af9a2-3046-4997-a69a-41d2b39a93a4)

## 1.7 Initializing the instance configuration for server instance:
### 1.7.1 Installing Git on EC2 instance (Nabeel_EC2_server01):

![image](https://github.com/nab1999/project1_part2/assets/126570628/4de5b963-d7ab-4bf6-8b06-233f21ff7d9f)

### 1.7.2 Cloning the server directory from github:

![image](https://github.com/nab1999/project1_part2/assets/126570628/2a8f1546-6d5d-42ef-9bf1-a9c0526a352f)

### 1.7.3 Installing Docker on EC2 instance (Nabeel_EC2_server01):

![image](https://github.com/nab1999/project1_part2/assets/126570628/6b753544-156a-47c2-a333-b0b64251a15f)

### 1.7.4 Starting Docker Service:

![image](https://github.com/nab1999/project1_part2/assets/126570628/0de0fed9-6b25-4cd6-a7fc-205a65a77a2d)

### 1.7.5 Enabling Docker Service:

![image](https://github.com/nab1999/project1_part2/assets/126570628/50fe7b8c-4f0c-4ea6-8490-b637fedcea1b)

### 1.7.6 Downloading the Docker Compose binary:

![image](https://github.com/nab1999/project1_part2/assets/126570628/e4b864ae-f253-40c7-99d7-b958892fe200)

### 1.7.7 Applying executable permissions to the Docker Compose binary:

![image](https://github.com/nab1999/project1_part2/assets/126570628/5638949e-5e8d-4b6e-8e78-da56ad92ab0d)

### 1.7.8 Verifying that Docker Compose is installed correctly:

![image](https://github.com/nab1999/project1_part2/assets/126570628/82f91d33-58d2-4819-bd99-c31a10f90b00)

### 1.7.9 Creating network “my-network” on EC2 instance (Nabeel_EC2_server01):

![image](https://github.com/nab1999/project1_part2/assets/126570628/52d5c9db-9afc-4277-a713-62f7185e30e5)

### 1.7.10 Using Docker Compose to create and run the server container on EC2 instance (Nabeel_EC2_server01):

![image](https://github.com/nab1999/project1_part2/assets/126570628/5b941d55-1019-4f94-9ff7-0ec59b5fd661)

### 1.7.11: Server Container created & stored the random file:

![image](https://github.com/nab1999/project1_part2/assets/126570628/c74b25d2-03c3-4be9-95e1-238d2b057d02)

## 1.8 Initializing the instance configuration for client instance:
### 1.8.1 Installing Git on EC2 instance (Nabeel_EC2_client01):

![image](https://github.com/nab1999/project1_part2/assets/126570628/bff1f2b6-95e9-4501-8d3a-d92d812914b7)

### 1.8.2 Cloning the client directory from github:

![image](https://github.com/nab1999/project1_part2/assets/126570628/cf18bf5c-c85a-423f-8310-4ef3904dc8ff)

### 1.8.3 Installing Docker on EC2 instance (Nabeel_EC2_client01):

![image](https://github.com/nab1999/project1_part2/assets/126570628/b7e02fa2-cd02-4e65-bd55-a7db079a617b)

### 1.8.4 Starting Docker Service:

![image](https://github.com/nab1999/project1_part2/assets/126570628/896e18cc-af01-449a-94e5-77cf08ab4bf1)

### 1.8.5 Enabling Docker Service:

![image](https://github.com/nab1999/project1_part2/assets/126570628/de8abb0a-3b16-4e65-b402-c066cce7e5a9)

### 1.8.6 Downloading the Docker Compose binary:

![image](https://github.com/nab1999/project1_part2/assets/126570628/037a1636-c483-43af-90dc-4a2cb6e8a901)

### 1.8.7 Applying executable permissions to the Docker Compose binary:

![image](https://github.com/nab1999/project1_part2/assets/126570628/90e26a22-09a2-445b-8f32-a1142a52ac74)

### 1.8.8 Verifying that Docker Compose is installed correctly:

![image](https://github.com/nab1999/project1_part2/assets/126570628/43e7088e-ed9c-41e4-929f-71fad8ec773b)

### 1.8.9 Changing client application python file (Updating IP address/Hostname and adding wait function to keep the container running):

![image](https://github.com/nab1999/project1_part2/assets/126570628/bc9da4cc-37b9-4a39-808a-16e59f8068d3)

### 1.8.10 Running the client container using Docker Compose:

![image](https://github.com/nab1999/project1_part2/assets/126570628/963c9a85-d1d7-4b82-8953-2be256e68575)

Client container created:

![image](https://github.com/nab1999/project1_part2/assets/126570628/223fc90d-2642-4252-a042-44dd13730216)

### 1.8.11 Client Container File Received:

![image](https://github.com/nab1999/project1_part2/assets/126570628/65290fcd-54bf-49cc-b258-e2292641cec6)
