pipeline {
    agent {
        docker {
            image 'node:12'
            args '-p 3000:3000'
        }
    }
    environment{
        CI="true"
    }
    stages {
        stage('Build') {
            steps {
                sh 'npm install'
            }
        }
        stage('Deliver') {
            steps {
                sh './jenkins/scripts/deliver.sh'
                // Remove need for user input to complete build
                // input message: 'Finished using the web site? (Click "Proceed" to continue)'
                // sh './jenkins/scripts/kill.sh'
            }
        }
    }
}
