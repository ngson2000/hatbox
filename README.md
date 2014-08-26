# Hatbox - A Vagrant Behat Box

*Vagrant files to build a Vagrant Box for Behat behavior-driven development tests of PHP applications and websites.*

This code will build a virtual machine to run Behat and Mink behavior-driven tests, also known as functional or acceptance testing.

- [Behat](http://docs.behat.org/en/v2.5/) is an open source behavior-driven development framework for PHP (version 5.3 and greater).
- [Mink](http://docs.behat.org/en/v2.5/cookbook/behat_and_mink.html) is a browser emulator abstraction layer. It hides emulator differences behind a single, consistent API.

## Installation

*Prerequisites: Vagrant should be installed and working on your system with NFS file sharing.  If it is not, see: [Prerequisites](#prerequisites) section below.*

### Step 1: Clone the Vagrant-Behat Repo

```
git clone git@github.com:seanbuscay/vagrant-behat.git
```

### Step 2: (Optional) Configure the Vagrant Box

You may make changes to some of the configurations for the Vagrant box.  To do so, edit the file `config/default/default/vagrant_config.yml`.  Comments in the config file provide explanations  about the variables which may be changed and their settings.

### Step 3: Start the Vagrant Box

Use the terminal to move into the directory into which you cloned the repo.  For example:

```
cd ~/workspace/vagrant-behat
```

Start the Vagrant Box with:

```
vagrant up
```

It will take several minutes to configure the virtual machine when running this command for the first time. **Subsequent runs will be much faster.**  

## Usage

### Login

After you have started the virtual machine, you may ssh into the virtual machine with the following command:

```
vagrant ssh
```

You will be logged into the virtual machine and you should see a prompt like:  `vagrant@hatbox:~$`

### Run the Example Tests

The Behat documentation site provides a tutorial about [developing web applications with behat and mink](http://docs.behat.org/en/v2.5/cookbook/behat_and_mink.html).  The example tests in this tutorial are already on your Vagrant box. To run the example tests, within your Vagrant box,

1. Move into the examples directory `cd /vagrant/examples`
2. Run the tests with the behat command `behat`

See the following sections of the Behat and Mink tutorial for an explanation of what the tests are doing and what you should expect to see when the tests run.

- [Writing your first web feature](http://docs.behat.org/en/v2.5/cookbook/behat_and_mink.html#writing-your-first-web-feature)
- [Test in-browser - selenium2 session](http://docs.behat.org/en/v2.5/cookbook/behat_and_mink.html#test-in-browser-selenium2-session)

### Run Your Own Tests


## Prerequisites

### Install Vagrant and Virtual Box

To get [Vagrant](http://www.vagrantup.com/downloads.html) running on your system, follow these steps:

1. Install VirtualBox - https://www.virtualbox.org/wiki/Downloads
2. Install Vagrant - http://docs.vagrantup.com/v2/installation/index.html
3. *(Optional)* To keep your Vagrant Box Utilities in sync with your Virtual Box Version, install the "vbguest plugin" with the following command:
```
vagrant plugin install vagrant-vbguest
```

### Verify NFS is Running

Make sure NFS is running on your (host) system.  

NFS comes pre-installed on OSX 10.5+.

See: [Network File System (NFS)](https://help.ubuntu.com/12.04/serverguide/network-file-system.html) for Linux systems.

*Troubleshooting:*

In OSX, to verify NFS is running, run the following command in the terminal:

```
sudo nfsd start
```

You should see an output like this:

```
The nfsd service is already running.
```

If you do not see the output above, follow the instructions in this wiki:

http://wiki.xbmc.org/?title=NFS#NFS_sharing_from_OS_X

If you get a message about the NFS Export File being invalid, this is a known issue with Vagrant.

Run the commands below to fix it:

```
sudo rm /etc/exports
sudo touch /etc/exports
vagrant halt
vagrant up --provision
```
Finally, if you cannot get NFS to work on your host system, you may turn off NFS file sharing by editing the Vagrant file and changing the following:

from:
```
config.vm.synced_folder vm_conf['host_path'], vm_conf['guest_path'], type: "nfs"
```
to:

```
config.vm.synced_folder vm_conf['host_path'], vm_conf['guest_path']
```
