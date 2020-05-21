## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

See the following file: Diagrams/Azure Network Diagram.pdf

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the install-elk.yml file may be used to install only certain pieces of it, such as Filebeat.

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

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the syslog and system metrics.

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name              | Function              		| IP Address        | Operating System |
|----------         |----------             		|------------   	  |------------------|
| Jump Box          | Gateway               		| 10.0.0.4      	  | Linux            |
| DVWA-VM1       	  | VM Web Server 		        | 10.0.0.5      	  | Linux            |
| DVWA-VM2       	  | VM Web Server 		        | 10.0.0.6      	  | Linux            |
| ELK-Server       	| ELK Log Mgt           		| 10.0.0.7      	  | Linux            |
| Load Balancer    	| Server Load Balancing 	  | 52.170.1.11       | Linux            |


### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump Box, ELK-Server, and Load Balancer machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses: 

The Jump Box will allow an SSH connection from the user’s specified home IP address.

ELK-Server: The ELK is configured with an public IP address to access Kibana analytics tools to see syslog data on VM1 and VM2 via user’s specified home IP address.

The Load Balancer will accept any HTTP:80 connections:  0.0.0.0

Machines within the network can only be accessed by Jump Box (10.0.0.5).

A summary of the access policies in place can be found in the table below.

| Name     		  | Publicly Accessible 	| Allowed IP Addresses              |
|---------------|-----------------------|-----------------------------------|
| Jump Box 		  | Yes                   |  user-specified home IP address   |
| DVWA-VM1 		  | No                    |  None    	                    	  |
| DVWA-VM2		  | No			              |  None		                          |
| ELK-Server 	  | Yes			              |  User-specified home IP address   |
| Load Balancer	| Yes			              |  0.0.0.0		                      |


### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because multiple vm’s can be configured via a playbook file from Ansible.

The playbook implements the following tasks:

- The ELK-playbook runs an installation for hosts with the name: elkservers.

- The play will first install Docker.io (used for running containers), then the python-pip module (package used to install Python software), and the Docker python module (Python client for Docker - required by ELK).

- The ELK server will be configured with an increase in virtual memory (vm.max_map_count=262144).

- Finally, a Docker ELK container will be downloaded and installed on the ELK server.  sebp/elk Docker container is downloaded with traffic allowed on the following ports:  5601, 9200, and 5044.

The following screenshot displays the result of running `docker ps -a` after successfully configuring the ELK instance.

See the following file:  Images/docker_ps_output.jpeg


### Target Machines & Beats
This ELK server is configured to monitor the following machines:

| Name              | IP Address    
|----------         |------------   	
| DVWA-VM1       	  | 10.0.0.5      	
| DVWA-VM2       	  | 10.0.0.6      	

We have installed the following Beats on these machines:
Filebeat
Metricbeat

These Beats allow us to collect the following information from each machine:

Filebeat: Filebeat is a lightweight shipper for forwarding and centralizing log data. Installed as an agent on your servers, Filebeat monitors the log files or locations that you specify, collects log events, and forwards them either to Elasticsearch or Logstash for indexing.

Metricbeat: Metricbeat is a lightweight shipper that you can install on your servers to periodically collect metrics from the operating system and from services running on the server. Metricbeat takes the metrics and statistics that it collects and ships them to the output that you specify, such as Elasticsearch or Logstash.


### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:

- Copy the Filebeat configuration file from your Ansible container to your ELK VM. Update the Filebeat configuration file by updating it with private IP address of the ELK server in the following two areas of the file:

output.elasticsearch:
hosts: ["(ELK Private IP Address):9200"]
username: "elastic"
password: "changeme"

setup.kibana:
host: "(ELK Private IP Address):5601"

The following command will install filebeat on webservers:  ansible-playbook install-filebeat.yml.  Install-elk.yml will install to ELK server.

Update the etc/ansible/hosts file by specifying the private IP addresses of the ELK server and webservers:

[elkservers]
10.0.0.7

[webservers]
10.0.0.5
10.0.0.6

Run the playbook and using a browser on the local machine, navigate to following web adress:  http://(ELKPublicIPAddress):5601


_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._

Command: curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.6.1-amd64.deb: downloads the .deb file from [artifacts.elastic.co]

Command: dpkg -i filebeat-7.6.1-amd64.deb: installs the .deb file.

Copy:
   `src: /etc/ansible/files/filebeat-configuration.yml`
   `dest: /etc/filebeat/filebeat.yml`: copies the filbeat-configuration file from ansible container to ELK-VM.

Command: filebeat modules enable system: starts processing common log formats.

Command: filebeat setup: creates index pattern and loads the dashboards into Kibana.

Command: service filebeat start: makes filebeat ready to send files to defined output.
