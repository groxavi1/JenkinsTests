pipeline {
    agent none
	parameters {
        string(defaultValue: '3', description: 'Version number.', name: 'version')
    }
	environment {
        VERSION = "${params.version}"
    }

    stages {
        stage('Kubernetes tests'){
            steps {
                withKubeConfig(credentialsId: 'internal-tools-cluster-credentials', serverUrl: 'https://35.237.228.119') {
                        sh 'kubectl get pods'
                    }
            }
        }
	}
}