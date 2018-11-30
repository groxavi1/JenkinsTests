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
                    string(credentialsId: 'internaltools-cluster-gke-kubectl-context', variable: 'GKE_CONTEXT'),
                    file(credentialsId: 'internaltools-cluster-gke-kubectl-config', variable: 'GKE_CONFIG')])
                {
                    sh '''
                        curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
                        chmod +x ./kubectl && alias kubectl=./kubectl
                        kubectl config --kubeconfig=$GKE_CONFIG set-context $GKE_CONTEXT
                        kubectl config get-contexts
                        kubectl get pods
                    '''
                }
            }
        }
	}
}