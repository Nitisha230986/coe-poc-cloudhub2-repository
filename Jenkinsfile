pipeline {
agent any
  tools { 
      maven 'Maven_Home' 
      jdk 'Jdk_11' 
    }

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
				git 'https://github.com/Nitisha230986/coe-poc-cloudhub2-repository.git'
        bat "mvn -Dmaven.test.failure.ignore=true clean package"
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
				git 'https://github.com/Nitisha230986/coe-poc-cloudhub2-repository.git'
		   		 bat "mvn test"	
		    		bat 'bat.yaml'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
				git 'https://github.com/Nitisha230986/coe-poc-cloudhub2-repository.git'
				bat "mvn -Dmaven.test.failure.ignore=true clean deploy -DmuleDeploy -Dusername=NitishaCI -Dpassword=Sep@230986 -DworkerType=MICRO -Dworkers=1 -Dregion=Cloudhub-US-East-2 -Dappdynamics.controller.hostName=https://hepburn202403271854354.saas.appdynamics.com/controller -Dappdynamics.controller.port=443 -Dappdynamics.agent.applicationName=test-mule-maven-cloud2-app -Dappdynamics.agent.tierName=tier1 -Dappdynamics.agent.nodeName=node1"
            }
        }
    }
}
