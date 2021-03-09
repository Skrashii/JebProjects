# JebProjects
Work from my cybersecurity course.

## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![RedTeam Network Diagram](https://github.com/Skrashii/JebProjects/blob/main/Diagrams/Azure_diagram.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the _____ file may be used to install only certain pieces of it, such as Filebeat.

![ELK Deployment Files](https://github.com/Skrashii/JebProjects/tree/main/Ansible)

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.
- Load balancers protect the availablity of a network by spreading the work across multiple servers, making the network harder to overload. The advantage of the Jumpbox is that any machines behind it do not need a public IP address and therefore are not exposed outside of the network.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the network and system logs.
- Filebeat watches for log changes, aggregates them, and sends that data to the output for which you've configured Filebeat.
- Metricbeat records metrics from your OS and services and sends that data to the output for which you've configured Metricbeat.

The configuration details of each machine may be found below.

| Name    | Function         | IP Address | Operating System |
|---------|------------------|------------|------------------|
| Jumpbox | Gateway          | 10.0.0.4   | Linux            |
| Web-1   | Azure VM         | 10.0.0.5   | Linux            |
| Web-2   | Azure VM         | 10.0.0.6   | Linux            |
| Web-3   | Azure VM         | 10.0.0.7   | Linux            |
| ELK     | Analytics Server | 10.1.0.4   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jumpbox machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- My personal IP address

Machines within the network can only be accessed by my personal IP address.

A summary of the access policies in place can be found in the table below.

| Name    | Publicly Accessible | Allowed IP Addresses |
|---------|---------------------|----------------------|
| Jumpbox |         Yes         | 67.166.xx.xx         |
| Web-1   |          No         | 10.0.0.4             |
| Web-2   |          No         | 10.0.0.4             |
| Web-3   |          No         | 10.0.0.4             |
| ELK     |         Yes         | 67.166.xx.xx         |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- it allows for very efficient and easily repeatable configuration across many machines and reduces the risk of human error.

The playbook implements the following tasks:
- Install docker.io
- Install python3-pip
- Increase virtual memory
- Download and launch a docker ELK container
- Make ports 5601, 9200, 5044 available

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![docker ps output](https://github.com/Skrashii/JebProjects/blob/main/Ansible/ELK-docker.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Web-1 10.0.0.5
- Web-2 10.0.0.6
- Web-3 10.0.0.7

We have installed the following Beats on these machines:
- Filebeat
- Metricbeat

These Beats allow us to collect the following information from each machine:
- Filebeat collects log events, such as those generated by MySQL databases
- Metricbeat collects metrics and statistics from your OS and other services, such as CPU usage.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the config file to /etc/ansible/roles/files
- Update the hosts file to include the private IPs of your webservers.
- Run the playbook, and navigate to http://<ELKpublicIP>:5601 to check that the installation worked as expected.

- Which file is the playbook? Where do you copy it?
  - filebeat-playbook.yml is the playbook file, it is copied into /etc/anisble/roles
- Which file do you update to make Ansible run the playbook on a specific machine?How do I specify which machine to install the ELK server on versus which to install Filebeat on?  
  - You update the hosts file with the IP of the machines you wish to run the playbook on.  To specify installation of ELK versus   filebeat, you simply create two groups in the hosts file, [webserver] and [elk]
- Which URL do you navigate to in order to check that the ELK server is running?
  - http://<ELKpublicIP>:5601
