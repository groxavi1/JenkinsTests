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
				bat "git config --global user.email "xavier.groleau@optelgroup.com"
				bat "git tag -a ${params.version} -m \"Release ${env.version}\""
				bat "git push origin ${env.VERSION}"
			}
			
		}
	}
}