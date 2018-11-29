pipeline {
    agent none
	parameters {
        string(defaultValue: '3', description: 'Version number.', name: 'version')
    }
	environment {
        VERSION = "${params.version}"
    }

    stages {
        stage('Py Compile') { 
            agent {
                docker {
                    image 'python:2-alpine' 
                }
            }
            steps {
                sh "kubectl get pods"
                sh 'python -m py_compile main.py' 
            }
        }
	}
}