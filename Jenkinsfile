pipeline {
    agent any
	parameters {
        string(defaultValue: '3', description: 'Version number.', name: 'version')
    }
	environment {
        VERSION = "${params.version}"
        GKE_PROD_NAMESPACE = "software-tools-webserver-prod"
        
    }

    stages {
        stage('Installing kubectl') {
            steps {
                withKubeConfig(caCertificate: '', contextName: '', credentialsId: 'internaltools-cluster-gke-kubectl-config', serverUrl: '')
                {
                    withCredentials([usernamePassword(credentialsId: 'internal-tools-gke-credentials-us-east1-b', passwordVariable: 'GKE_PASSWORD', usernameVariable: 'GKE_USER')])
                    {
                    sh """
                        curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
                        chmod +x ./kubectl && alias kubectl=./kubectl
                        kubectl get pods
                    """
                    }
                }
            }
        }
	}
}