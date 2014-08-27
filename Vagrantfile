##############################################
# Settings                                   #
##############################################

# Require yaml to parse configuaration values
# No need to edit Vagrant file directly.  Instead edit:
# config/default/vagrant_config.yml
require 'yaml'
current_dir = File.dirname(File.expand_path(__FILE__))
vm_conf = YAML.load_file("#{current_dir}/config/default/vagrant_config.yml")

# Set paths to the provision scripts.
prov_script = "#{current_dir}/provision/provision.sh"
behat_script = "#{current_dir}/provision/behat.sh"
phpunit_script = "#{current_dir}/provision/phpunit.sh"

# Set API Version
VAGRANTFILE_API_VERSION = "2"

##############################################
# Work                                       #
# There's no need to edit below this point.  #
##############################################

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Base box
  config.vm.box = vm_conf['box']
  config.vm.hostname = "hatbox"

  # Set network to private in order to use NFS
  config.vm.network "private_network", ip: vm_conf['ip']
  config.ssh.forward_agent = true

  # Share folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder.
  # TODO: Make type and exclude path configurable.
  # config.vm.synced_folder vm_conf['host_path'], vm_conf['guest_path'], type: "rsync", rsync__exclude: ".git/"
  config.vm.synced_folder vm_conf['host_path'], vm_conf['guest_path'], type: "nfs"


  config.vm.provider "virtualbox" do |vb|
    # Use VBoxManage to customize the VM memory:
    vb.customize ["modifyvm", :id, "--memory", vm_conf['memory']]

    # more cpus to try and speed up build time
    vb.customize ["modifyvm", :id, "--cpus", vm_conf['cpus']]

    # increase cpu cap
    vb.customize ["modifyvm", :id, "--cpuexecutioncap", vm_conf['cpu_cap']]

    # this is apparenly required for a 64 bit guest and multiple virtual cpus
    # TODO: Have this check for 64bit and if on multiple cpus
    vb.customize ["modifyvm", :id, "--ioapic", "on"]
  end

  config.vm.provision "shell" do |s|
    s.path = "#{prov_script}"
  end
  # set :privileged => false so the script it ran as the vagrant user, not as
  # root.
  config.vm.provision :shell, :path => "#{behat_script}", :privileged => false
  config.vm.provision :shell, :path => "#{phpunit_script}", :privileged => false

end
