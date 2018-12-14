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
            //comment
            when{
                branch 'master'
            }
            steps {
                withKubeConfig(credentialsId: 'internaltools-cluster-gke-kubectl-config')
                {
                    withCredentials([usernamePassword(credentialsId: 'internal-tools-gke-credentials-us-east1-b', passwordVariable: 'GKE_PASSWORD', usernameVariable: 'GKE_USER')])
                    {
                    sh """
                        curl -LO https://storage.googleapis.com/kubernetes-release/release/\$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
                        chmod +x ./kubectl && alias kubectl=./kubectl
                        kubectl config set-credentials $GKE_USER --username=$GKE_USER --password=$GKE_PASSWORD
                        kubectl config set-context \$(kubectl config current-context) --namespace=${env.GKE_PROD_NAMESPACE}
                        kubectl get pods
                    """
                    }
                }
            }
        }
	}
}