Vagrant Box for 
RDA Europe spring school on weather, climate and air quality
25-26 May 2017
==================================

##Software Required:
- Vagrant: https://www.vagrantup.com/
- VirtualBox: https://www.virtualbox.org
- Git to clone this repository and keep up to date
- Install latest versions of Vagrant and Virtualbox from their websites. 
  Versions in package repositories may be outdated and be incompatible
  with these scripts

##Steps to prepare the environment:
1. Download and install the latest version of VirtualBox
2. Download and install the latest version of Vagrant
3. Clone this repository: `git clone git@github.com:HiEST/rdasparkhandson.git`
4. Run the box

##Steps to run the Box:
1. run `vagrant up`
2. run `vagrant ssh` to log into the machine
3. run `vagrant halt` to stop the VM
4. run `vagrant destroy` to delete the VM and its associated image


##Reprovision:
If something changes in the vagrant configuration and you need to reprovision, 
 run `vagrant up provision`

