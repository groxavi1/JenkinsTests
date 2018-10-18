pipeline {
    agent none 
    stages {
        stage('Information') { 
            agent any
            steps {
                sh 'groups' 
            }
        }
        stage('Py Compile') { 
            agent {
                docker {
                    image 'python:2-alpine' 
                }
            }
            steps {
                sh 'python -m py_compile main.py' 
            }
        }
    }
}
