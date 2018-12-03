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
                withKubeConfig(caCertificate: '', contextName: '', credentialsId: 'internaltools-cluster-gke-kubectl-config', serverUrl: '')
                {
                    withCredentials([usernamePassword(credentialsId: 'internal-tools-gke-credentials-us-east1-b', passwordVariable: 'GKE_PASSWORD', usernameVariable: 'GKE_USER')])
                    {
                        sh '''
                            ls $HOME/.kube
                            curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
                            chmod +x ./kubectl && alias kubectl=./kubectl
                            kubectl config set-credentials $GKE_USER --username=$GKE_USER --password=$GKE_PASSWORD
                            kubectl config get-contexts
                            kubectl get pods
                        '''
                    }
                }
            }
        }
	}
}