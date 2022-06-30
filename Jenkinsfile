pipeline {
    agent any
    environment {
        registry = "okip/cieks"
        registryCredential = "Docker_UserID"
    }
    stages {
        stage('Build Image') {
            steps {
                script {
                    docker.build registry + ":$BUILD_NUMBER" 
                }
            }
        }
        stage ('Pushing to Docker') {
            steps {
                script {
                    docker.withRegistry( '', registryCredential ) {
                    sh 'docker push okip/cieks' + ":$BUILD_NUMBER"
           }
         }
       }
     }
        stage ('Pushing to Kubernetes') {
            steps {
                script {
                    withKubeConfig(caCertificate: '', clusterName: '', contextName: '', credentialsId: 'EKS-CRED-ID', namespace: '', serverUrl: '') {
                     sh 'kubectl apply -f eks-deploy.yml'
                  }
                }
            }
        }
    }
}