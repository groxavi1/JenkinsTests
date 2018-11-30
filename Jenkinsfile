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
                    file(credentialsId: 'internaltools-cluster-gke-kubectl-config', variable: 'GKE_CONFIG')])
                {
                    sh '''
                        curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
                        chmod +x ./kubectl && alias kubectl=./kubectl
                        cat \$GKE_CONFIG
                        cp \$GKE_CONFIG >> $HOME/.kube/config
                        kubectl config get-contexts
                        kubectl get pods
                    '''
                }
            }
        }
	}
}