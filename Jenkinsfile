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
			steps {
				bat "git tag -a ${params.version} -m \"Release ${params.version}\""
				bat "git push origin ${env.VERSION}"
			}
			
		}
	}
}

def getValue(String value){
    return value
}