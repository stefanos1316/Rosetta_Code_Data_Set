# Rosetta_Code_Data_Set
A repository for data set paper purposes

# Deploy 
In this repository, we use ansible yaml file for auto-deploy purposes. That means, you can execute the .yaml file to install all the programming languages---having tasks in this data-set---and their packages. To do that, install the ansible modules and then copy the .yaml (found in the parent director of this repository) in teh /etc/ansible directory. Then execute the following command.
		$ sudo ansible-playbook rosetta_code_data_set_dependencies.yml

This will install all the programming languages, their package manager utilities, and the necessary packages/modules to execute the Rosette Code data-set.

Execute make file		
		$ make

# Tools 

For estimating run-time performance me make use of Linux build-in command __time__.
To retreive the energy consumption we use the [__likwid-powermeter__]().
The energy usage if given from ... 
