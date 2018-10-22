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
            }
			echo "before ${params.testing}"
			params.testing = "AFTER MOTHERFUCKER"
			echo "after: ${params.testing}"
			
        }
        stage('Py Compile') { 
            agent {
                docker {
                    image 'python:2-alpine' 
                }
            }
            steps {
                sh 'python -m py_compile main.py' 
				jiraGetIssue
            }
        }
    }
}
