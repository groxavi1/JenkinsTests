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
                    kubeconfigContent(credentialsId: 'intarnal-tool-us-east-1-kubectl-config', variable: 'GKE_CONFIG')])
                {
                    sh '''
                        curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
                        chmod +x ./kubectl && alias kubectl=./kubectl
                        cat $GKE_CONTEXT
                        cat $GKE_CONTEXT >> $HOME/.kube/config
                        kubectl config get-contexts
                        kubectl get pods
                    '''
                }
            }
        }
	}
}