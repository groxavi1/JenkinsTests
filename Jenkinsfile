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
		stage('Update on gcloud') {
			steps {
				script{
					//TODO: setup for the dev setup when created
					stage('Update on gcloud') {
                        //TODO: setup for the dev setup when created
                        if (env.BRANCH_NAME == 'master'){
                            withKubeConfig(credentialsId: 'internaltools-cluster-gke-kubectl-config')
                            {
                                withCredentials([usernamePassword(credentialsId: 'internal-tools-gke-credentials-us-east1-b', passwordVariable: 'GKE_PASSWORD', usernameVariable: 'GKE_USER')])
                                {
									withEnv(["PATH=${WORKSPACE}:${env.PATH}"]){
										echo "$PATH"
										sh """
											curl -LO https://storage.googleapis.com/kubernetes-release/release/\$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
											chmod +x ./kubectl
											kubectl config set-credentials $GKE_USER --username=$GKE_USER --password=$GKE_PASSWORD
											kubectl config set-context \$(kubectl config current-context) --namespace=${env.GKE_PROD_NAMESPACE}
											cd folder
											bash ./test.sh update-image
										"""
									}
                                }
                            }
                        }
                    }
				}
			}
		}
	}
}