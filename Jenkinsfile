pipeline {
    agent any
	parameters {
        string(defaultValue: '3', description: 'Version number.', name: 'version')
    }
	environment {
        VERSION = "${params.version}"
                REGISTRY_URL = "gcr.io"
        GCP_PROJECT = "internaltools-184612"
        REPO_NAME = "software_tools_webserver"
        IMAGE_NAME = "${env.REGISTRY_URL}/${env.GCP_PROJECT}/${env.REPO_NAME}"
        GCR_CREDENTIALS = "gcr:internaltools-gcr-credentials"
        BRANCH_TAG = "${env.BRANCH_NAME}-${env.BUILD_NUMBER}"
        IMAGE_TAGGED = "${env.IMAGE_NAME}:${env.BRANCH_TAG}"
        PYLINT_FAILBUILD = "${params.pylint_failbuild}"
        SKIP_SONARQUBE_ANALYSIS = "${params.skip_sonarqube_analysis}"

        VENV = ".venv"
        VENV_PATH = "${VENV}/bin"
    }

    stages {
        stage('Installing kubectl') {
            steps {
                withKubeConfig(caCertificate: '', contextName: '', credentialsId: 'internaltools-cluster-gke-kubectl-config', serverUrl: '')
                {
                    withCredentials([usernamePassword(credentialsId: 'internal-tools-gke-credentials-us-east1-b', passwordVariable: 'GKE_PASSWORD', usernameVariable: 'GKE_USER')])
                    {
                        sh 'curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl'
                        sh "chmod +x ./kubectl && alias kubectl=./kubectl"
                        sh "kubectl config set-credentials $GKE_USER --username=$GKE_USER --password=$GKE_PASSWORD"
                        sh "kubectl config get-contexts"
                        sh "kubectl get pods"
                        
                    }
                }
            }
        }
	}
}