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
                sh 'python -m py_compile main.py' 
            }
        }
		stage('Create Release'){
			agent any
			steps {
				echo "${env.version}"
				sh "git config --global user.name 'Xavier Groleau'"
				sh "git config --global user.email 'xavier.groleauh@example.com'"
				sh "git tag -a ${params.version} -m \"Release ${env.version}\""
				sh "git push origin ${env.VERSION}"
			}
			
		}
	}
}