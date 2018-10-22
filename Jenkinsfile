pipeline {
    agent none
	parameters {
		string(defaultValue: "before", description: "testing", name: "testing")
	}
    stages {
        stage('Information') { 
            agent any
            steps {
                sh 'groups' 
				echo "${params.testing}"
				script {
					params.testing =  "after
				}
				echo "${params.testing}"
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
