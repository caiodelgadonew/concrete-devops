# Concrete DevOps Lab

This Vagrantfile creates the lab for Concrete DevOps on virtualbox with Linux, Docker, Minikube and Jenkins

* Default Configuration requires 6GB of free RAM  
* Increase or decrease RAM configuration of any machine if necessary  

* Dont forget to create the following entries on hosts file

```
10.111.111.10     k8s.concrete.example  
10.111.111.20     ci.concrete.example
```

* Hosts File Location by OS: 
  * Linux
    * `/etc/hosts`
  * MacOSx
    * `/etc/hosts`
  * Windows
    * `C:\Windows\system32\drivers\etc\hosts`

## Jenkins Configuration

To configure jenkins as a new install please be sure to get the initial admin password, the `jenkins_home` folder will be mounted at `/opt/jenkins_home`

Get the initial admin password: 

```bash
$ cd {VAGRANT_FOLDER}
$ vagrant ssh ci -c 'cat /opt/jenkins_home/secrets/initialAdminPassword'
``` 

### Moving from an old Jenkins Server 

To get your data back from a older instalation of jenkins make a backup of the folders `jobs`, `workspace` and `plugins` from `jenkins_home` folders

You can do it by using tar and moving it into the vagrant concrete-devops folder.


```bash
$ cd {JENKINS_HOME}

$ tar -cf jenkins_backup.tar.gz {jobs,workspace,plugins}

$ mv jenkins_backup.tar.gz {VAGRANT_FOLDER}

$ cd {VAGRANT_FOLDER}

$ vagrant ssh ci

$ tar -xf /vagrant/jenkins_backup.tar.gz -C /opt/jenkins_home

$ docker-compose -f /vagrant/docker-compose.yml down

$ docker-compose -f /vagrant/docker-compose.yml up -d
```

> Change `{JENKINS_HOME}` for the full path of jenkins home folder of the older installation

> Change `{VAGRANT_FOLDER}` to the full path of the concrete-devops vagrant project folder 