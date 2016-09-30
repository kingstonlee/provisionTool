# Provision Tool

A basic provisioning tool to setup an Ubuntu machine with Apache and PHP

## Initial Setup
Download the bootstrap.sh file and run it using this command:

`wget https://raw.githubusercontent.com/kingstonlee/provisionTool/master/bootstrap.sh -O - | sh`

## Running Manually

`/opt/provisionTool/init.sh`

## How It Works
I've split the install into different parts based on dependencies.
bootstrap.sh
init.sh ->  package.sh
        ->  services.sh ->  apache.sh
                         
### Bootstrap
This is the file that will setup basic packages and clone the provisionTool repository

### Init
This is the base script that will make sure regular script running will happen on a cron.  It will also call the package and service scripts

#### Package
This is the script that will install packages that are needed for this server.  
Add new packages to the `installlist` list

#### Services
This is the script that will ensure that services are running properly and take care of changes that are made.
Currently the only service that is being checked is apache.  

The script calls the individual service scripts which will handle changes to config files that are saved in the repository.  The config files should be stored in the repository so we can track changes.
