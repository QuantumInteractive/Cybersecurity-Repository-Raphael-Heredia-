## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

Images/diagram_filename.png

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the <playbook> file may be used to install only certain pieces of it, such as Filebeat.

  - _ <filebeat-playbook.yml> _ http://20.85.218.193/setup.php

This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly <available>, in addition to restricting <access> to the network.
- _TODO: What aspect of security do load balancers protect? <protection from Unwanted or unauthroized traffic of multiple servers in a server farm>  What is the advantage of a jump box?_<>

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the <jumpbox> and system <network>.
- _TODO: What does Filebeat watch for?_ <filebeats watch for the data about the file system>
- _TODO: What does Metricbeat record?_ <metricbeats watch for machine metrics, such as uptime>.

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway  | 10.0.0.4   | Linux            |
| Web_1    | Server   | 10.0.0.5   | Linux            |
| Web_2    | Server   | 10.0.0.6   | Linux            |
| Elk VM   | Server   | 10.1.0.4   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the <virtual> machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- _TODO: Add whitelisted IP addresses_

Machines within the network can only be accessed by _____.
- _TODO: Which machine did you allow to access your ELK VM? What was its IP address?_

A summary of the access policies in place can be found in the table below.

| Name                 | Publicly Accessible | Allowed IP Addresses         |
|----------            |---------------------|----------------------        |
| Jump Box Provisioner | Yes/No              | 10.0.0.1 10.0.0.2 10.0.0.4   |
|                      |                     |                              |
|                      |                     |                              |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- _TODO: What is the main advantage of automating configuration with Ansible?_

The playbook implements the following tasks:
- _TODO: In 3-5 bullets, explain the steps of the ELK installation play. E.g., install Docker; download image; etc._
- <the first task correlates with the use of an apt module -manging packages with an apt packet manager - with the installation of a Docker.io and a python3.pip> 
- <the command module is configured, which will increase the virtual memory on ansible; likewise sysctl will expand virtual memoryon ansible>
- <the Docker contain Module allows for the download and launch of the docker elk container>
- <the systemd module ensures the running process of the docker runs when activated or booted>

---
- name: Configure Elk VM with Docker
  hosts: elk
  remote_user: Vadmin
  become: true
  tasks:
    # Use apt module
    - name: Install docker.io
      apt:
        update_cache: yes
        force_apt_get: yes
        name: docker.io
        state: present

      # Use apt module
    - name: Install python3-pip
      apt:
        force_apt_get: yes
        name: python3-pip
        state: present

      # Use pip module (It will default to pip3)
    - name: Install Docker module
      pip:
        name: docker
        state: present

      # Use command module
    - name: Increase virtual memory
      command: sysctl -w vm.max_map_count=262144

      # Use sysctl module
    - name: Use more memory
      sysctl:
        name: vm.max_map_count
        value: '262144'
        state: present
        reload: no

      # Use docker_container module
    - name: download and launch a docker elk container
      docker_container:
        name: elk
        image: sebp/elk:761
        state: started
        restart_policy: always
        # Please list the ports that ELK runs on
        published_ports:
          -  5601:5601
          -  9200:9200
          -  5044:5044
      # Use systemd module
    - name: Enable service docker on boot
      systemd:
        name: docker
        enabled: yes
        

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![TODO: Update the path with the name of your screenshot of docker ps output](Images/docker_ps_output.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- _TODO: List the IP addresses of the machines you are monitoring_
- _ <ip: 52.143.97.243>
- _ <ip: 20.85.218.193>
- _ <ip: 58.186.168.196>

We have installed the following Beats on these machines:
- <filebeat> <metricbeat>

These Beats allow us to collect the following information from each machine:
- _TODO: In 1-2 sentences, explain what kind of data each beat collects, and provide 1 example of what you expect to see. E.g., `Winlogbeat` collects Windows logs, which we use to track user logon events, etc._
- _ <filebeat is a filedata-based protocol that forward and centralizes log data to Elasticsearch - or logstash - for indexing.> 
- _ <metricbeat is a lightweight shipper installed on servers to collect metrics periodically, for services running on the system.>
### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the _____ file to _____.
- Update the _____ file to include...
- Run the playbook, and navigate to ____ to check that the installation worked as expected.

_TODO: Answer the following questions to fill in the blanks:_ 
- _Which file is the playbook? Where do you copy it?_ <copy the install_elk.yml file to /etc/ansible>
- _Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?_ <update the filebeat-config.yml file must be altered to run a specific machine, which must include altering the filebeat-config.yml to direct the kibana IP to the Elk VM>
- _Which URL do you navigate to in order to check that the ELK server is running? <run the playbook, and navigate to the URL http://52.143.97.243/setup.php to check that the installation worked as expected>

