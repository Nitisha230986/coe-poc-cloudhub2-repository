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
		   		 bat 'bat.yaml'	
		    script{
			    def json = readJSON file: './reporter/local.json'
def jsonFormat = JsonOutput.toJson(json)
prettyJSON = JsonOutput.prettyPrint(jsonFormat)
echo "${prettyJSON}"
		    }
		    
		    		
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
				git 'https://github.com/Nitisha230986/coe-poc-cloudhub2-repository.git'
				bat "mvn -Dmaven.test.failure.ignore=true clean deploy -DmuleDeploy -Dusername=NitishaCI -Dpassword=Sep@230986 -DworkerType=MICRO -Dworkers=1 -Dregion=Cloudhub-US-East-2"
            }
        }
    }
}
