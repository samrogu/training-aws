pipeline {
    agent any

    stages {
        stage('init') {
            steps {
                dir("packer/jenkins") {
                    sh "packer init ."
                }
            }
        }
        stage('validate') {
            steps {
                dir("packer/jenkins") {
                    sh "packer validate ."
                }
            }
        }
        stage('build') {
            steps {
                withCredentials([aws(credentialsId: 'aws-cred')]) {
                    dir("packer/jenkins") {
                        sh "packer build ."
                    }
                }
            }
        }
    }
}