Vagrant.configure("2") do |config|
  BOX = "almalinux/9"
  VERSION = "9.6.20250522"
  config.ssh.insert_key = true
  config.vm.provision "file", source: "~/.ssh/local_lab.pub", destination: "/home/vagrant/.ssh/local_lab.pub"
 
  config.vm.provision "shell", inline: <<-SHELL
    chmod 644 /home/vagrant/.ssh/local_lab.pub
    cat /home/vagrant/.ssh/local_lab.pub | tee -a /home/vagrant/.ssh/authorized_keys
  SHELL

  config.vm.define "ceph-mon" do |mon|
    mon.vm.box = BOX
    mon.vm.box_version = VERSION
    mon.vm.hostname = "ceph-mon"
    mon.vm.network "private_network", ip: "192.168.56.101"
    mon.vm.provider "virtualbox" do |vb|
      vb.memory = 4096
      vb.cpus = 2
    end
  end

  config.vm.define "ceph-osd-01" do |osd1|
    osd1.vm.box = BOX
    osd1.vm.box_version = VERSION
    osd1.vm.hostname = "ceph-osd-01"
    osd1.vm.network "private_network", ip: "192.168.56.102"
    osd1.vm.disk :disk, size: "50GB", primary: false, name: "osd1_data"
    osd1.vm.provider "virtualbox" do |vb|
      vb.memory = 4096
      vb.cpus = 2
    end
  end

  config.vm.define "ceph-osd-02" do |osd2|
    osd2.vm.box = BOX
    osd2.vm.box_version = VERSION
    osd2.vm.hostname = "ceph-osd-02"
    osd2.vm.network "private_network", ip: "192.168.56.103"
    osd2.vm.disk :disk, size: "50GB", primary: false, name: "osd2_data"
    osd2.vm.provider "virtualbox" do |vb|
      vb.memory = 4096
      vb.cpus = 2
    end
  end

  config.vm.define "ceph-osd-03" do |osd3|
      osd3.vm.box = BOX
      osd3.vm.box_version = VERSION
      osd3.vm.hostname = "ceph-osd-03"
      osd3.vm.network "private_network", ip: "192.168.56.104"
      osd3.vm.disk :disk, size: "50GB", primary: false, name: "osd3_data"
      osd3.vm.provider "virtualbox" do |vb|
        vb.memory = 4096
        vb.cpus = 2
      end
    end

end
