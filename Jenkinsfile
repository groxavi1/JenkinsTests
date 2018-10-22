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
				currentBuild.rawBuild.project.description = 'NEW JOB DESCRIPTION'
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
