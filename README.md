# Vagrant Behat


*Vagrant files to build a Vagrant Box for Behat behavior-driven development tests of PHP applications and websites.*

This code will build a virtual machine to run Behat and Mink behavior-driven tests, also known as functional or acceptance testing.

- Behat is an open source behavior-driven development framework for PHP (version 5.3 and greater). See: http://docs.behat.org/en/v2.5/
- Mink is a browser emulator abstraction layer. It hides emulator differences behind a single, consistent API. See: http://docs.behat.org/en/v2.5/cookbook/behat_and_mink.html

## Installation

*Prerequisites: Vagrant should be installed and working on your system.  If it is not, see: [Prerequisites - Vagrant](#prerequisites---vagrant) section below.*

#### Step 1: Clone the Vagrant-Behat Repo

    git clone git@github.com:seanbuscay/vagrant-behat.git

#### Step 2: (Optional) Configure the Vagrant Box



#### Step 3: Start the Vagrant Box

Use the terminal to move into the directory into which you cloned the repo.  For example:

    cd ~/workspace/vagrant-behat

Start the Vagrant Box with:

    vagrant up

It will take several minutes to configure the virtual machine when running this command for the first time. Subsequent runs will be much faster.  


**Use nfs**

*Set up your Mac*

NFS comes pre-installed on OSX 10.5+.

To verify it is running, run the following command in the Mac terminal:

```
sudo nfsd start
```

You should see an output like this:

```
The nfsd service is already running.
```

If you do not, follow the instructions in this wiki:

http://wiki.xbmc.org/?title=NFS#NFS_sharing_from_OS_X

*Troubleshooting:*

If you get a message about the NFS Export File being invalid, this is a known issue with Vagrant.

Run the commands below to fix it:

```
sudo rm /etc/exports
sudo touch /etc/exports

vagrant halt
vagrant up --provision
```
