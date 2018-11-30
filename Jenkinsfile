pipeline {
    agent any
	parameters {
        string(defaultValue: '3', description: 'Version number.', name: 'version')
    }
	environment {
        VERSION = "${params.version}"
    }

    stages {
        stage('Installing kubectl') {
            steps {
                withCredentials([
                    usernamePassword(credentialsId: 'internal-tools-gke-credentials-us-east1-b', passwordVariable: 'GKE_PASSWORD', usernameVariable: 'GKE_USER'),
                    file(credentialsId: 'internal-tools-gke-us-east1-b-certificate', variable: 'GKE_CERTIFICATE')])
                {
                    sh '''
                        curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
                        chmod +x ./kubectl && alias kubectl=./kubectl
                        kubectl config set-credentials user --username=$GKE_USER --password=$GKE_PASSWORD
                        kubectl config set-cluster gke_internaltools-184612_us-east1-b_internaltools-cluster --insecure-skip-tls-verify=true --server=https:35.237.228.119
                        kubectl config get-contexts
                    '''
                }
            }
        }
	}
}