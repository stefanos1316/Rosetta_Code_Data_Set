# Rosetta_Code_Data_Set
A repository for data set paper purposes


# Deploy 
In this repository, we use ansible yaml file for auto-deploy purposes. That means, you can execute the .yaml file to install all the programming languages---having tasks in this data-set---and their packages. To do that, install the ansible modules and then copy the .yaml (found in the parent director of this repository) in teh /etc/ansible directory. Then execute the following command.

For Fedora use:
	
		$ sudo ansible-playbook fedora_dependencies.yml
	
For Ubuntu use:
	
		$ sudo ansible-playbook ubuntu_dependencies.yml


This will install all the programming languages, their package manager utilities, and the necessary packages/modules to execute the Rosette Code data-set.

Execute make file

		$ make


# Tools 
Make sure that the package linux-tools-generic for the correspindning kernel is installed (usually distro suggests the associated package).
We make use of perf command in order to obtain measurements related to tasks execution.
This is done using the pkg and ram performance counter events:

		$ sudo perf stat -r [number of repetitions] -e power/energy-pkg/,power/energy-ram/  [utility] executable
