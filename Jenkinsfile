pipeline {
    agent none
	
	parameters {
        string(defaultValue: '3', description: 'Version number.', name: 'version')
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
				bat "git tag -a ${params.version} -m \"Release ${params.version}\""
				bat "git push origin ${params.version}"
			
		}
	}
}

def getValue(String value){
    return value
}