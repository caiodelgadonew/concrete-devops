$script = <<-EOF
HOSTS=$(head -n7 /etc/hosts)
echo -e "$HOSTS" > /etc/hosts
echo '10.111.111.10     k8s.concrete.example' >> /etc/hosts
echo '10.111.111.20     ci.concrete.example' >> /etc/hosts
EOF

machines = {
    "k8s" => {"memory" => "4096", "ip" => "10"},
    "ci"  => {"memory" => "2048", "ip" => "20"}
}

Vagrant.configure "2" do |config| 
  machines.each do |name,conf| 
    config.vm.define "#{name}" do |machine| 
      machine.vm.box = "ubuntu/bionic64"
      machine.vm.hostname = "#{name}.concrete.example"
      machine.vm.network "private_network", ip: "10.111.111.#{conf["ip"]}"
      machine.vm.provider "virtualbox" do |vb| 
        vb.name = "#{name}"
        vb.memory = conf["memory"]
        vb.cpus = 2
        vb.customize ["modifyvm", :id, "--groups", "/Desafio-Concrete-DevOps"]
      end
    end
  end
  config.vm.provision "shell", inline: $script
#  config.vm.synced_folder ".", "/vagrant", type: "nfs"   # For MacOSx uncomment this line
end 
