pipeline {
    agent none

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
			script {
				env.RELEASE_TAG = "v3"
			}
			bat "git tag -a ${env.RELEASE_TAG} -m \"Release ${env.RELEASE_TAG}\""
            bat "git push origin ${env.RELEASE_TAG}"
		
		}
    }
}

def getValue(String value){
    return value
}