# azure-k8s-jenkins

## Deploying Jenkins

1. Deploy the Jenkins quickstart template:

	```
	azure group create --location "westus" --template-uri "https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/jenkins-on-ubuntu/azuredeploy.json" --name "k8s-jenkins"
	```

	Use the folowing parameters:

	region: West US
	storageAccountPrefix: k8sjenkins01
	adminUsername: kube
	adminPassword: Azur3Lin#x
	dnsName: k8s-jenkins

2. SSH in, then:

	Execute the `update-machine.sh` script in this repo on all of the machines.

3. Configure Jenkins (Security)

	Enable security, but allow all users to do anything. After creating an account, go back and restrict to "Logged in users can do anything".

3. Configure Jenkins (Plugins)

	i. update existing plugins
	ii. install 'multijob'
	iii. install 'configuration slicing'
	iv. install 'git scm'


4. Install the Jenkins Job Builder defined jobs.

	First, create a jenkins_jobs file. (see in this repo)

	Second:

	```
	git clone https://github.com/colemickens/kubernetes.git
	cd kubernetes/hack/jenkins
	touch jenkins_jobs.ini
	sudo ./update-jobs.sh hack/jenkins/job-configs;hack/jenkins/kubernetes-jenkins-azure
	```

5. Mark some nodes as 'build' for the build jobs to work


6. Login into docker on the machines

```shell
$ sudo -s
# su jenkins
$ docker login
```


7. Put azure service principal credentials on the machines:
`/var/lib/jenkins/azure_client_id`
and `/var/lib/jenkins/azure_client_secret`


8. Change /etc/default/jenkins to have jenkins live on /mnt which is the data drive

9. Modify docker storage to be on /mnt

9. Change the user config so that `jenkin`s home directory is /mnt/jenkins
