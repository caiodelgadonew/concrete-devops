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
      machine.vm.provision "shell", path: "scripts/hosts.sh"
      machine.vm.provision"shell", path: "scripts/docker.sh"
      if "#{name}" == "k8s"
        machine.vm.provision"shell", path: "scripts/k8s.sh"
      end
      if "#{name}" == "ci"
        machine.vm.provision"shell", path: "scripts/ci.sh"
      end
    end
  end
end 
