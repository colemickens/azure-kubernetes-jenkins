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

	First, allow Jenkins to update the existing plugins that are out-of-date.

	Second, install the `multijob` plugin.

	Third (optional), install the `configuration slicing` plugin. We will use this to disable all jobs and then we will manually active the Azure jobs.


4. Install the Jenkins Job Builder defined jobs.

	First, create a jenkins_jobs file. (see in this repo)

	Second:

	```
	git clone https://github.com/colemickens/kubernetes.git
	cd kubernetes/hack/jenkins
	touch jenkins_jobs.ini
	run ./update-jobs.sh hack/jenkins/job-configs;hack/jenkins/kubernetes-jenkins;hack/jenkins/kubernetes-jenkins-pull
	```

