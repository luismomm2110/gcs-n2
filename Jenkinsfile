pipeline{  
  environment {
    registry = "luismomm2110/nodejs-helloworld"
    registryCredential = 'dockerhub'
    dockerImage = ''
  }
  agent any
    stages {
        stage('Build'){
           steps{
              script{
                sh 'npm install'
              } 
           }   
        }
        stage('Building image') {
            steps{
                script {
                  dockerImage = docker.build registry + ":latest"
                 }
             }
          }
          stage('Push Image') {
              steps{
                  script {
                       docker.withRegistry( '', registryCredential){                            
                       dockerImage.push()
                      }
                   }
                } 
           }
           stage('Deploying into k8s'){
            steps{
		withKubeConfig([credentialsId: 'k8s', serverUrl: "https://192.168.49.2:8443"])
	{
                sh 'kubectl apply -f deployment.yml' 
	}
            }
        }
    }
}
