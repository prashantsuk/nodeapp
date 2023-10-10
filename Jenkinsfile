pipeline {
    agent any 
    environment {
    DOCKERHUB_CREDENTIALS = credentials('prashant680844-dockerhub')
    }
    stages { 
        stage('SCM Checkout') {
            steps{
            git 'https://github.com/ravdy/nodejs-demo.git'
            }
        }

        stage('Build docker image') {
            steps {  
                sh 'docker build -t prashant680844/nodeapp:$BUILD_NUMBER .'
            }
        }
        stage('login to dockerhub') {
            steps{
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('push image') {
            steps{
                sh 'docker push prashant680844/nodeapp:$BUILD_NUMBER'
            }
        }
         stage('Scan Image') {
            steps{
                sh 'trivy image prashant680844/nodeapp:$BUILD_NUMBER'
            }
        }
}
post {
        always {
            sh 'docker logout'
        }
    }
}
