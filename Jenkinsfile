def dockerImage
pipeline {
    agent {
      any
    }
    triggers{
        pollSCM(env.BRANCH_NAME == "master" ? "*/5 * * * *" : "")
    }
    environment {
        GCP_PROJECT = "internaltools-184612"
        REPO_NAME = "optelcloud"
        REGISTRY_URL = "gcr.io"
        IMAGE_NAME = "${env.REGISTRY_URL}/${env.GCP_PROJECT}/${env.REPO_NAME}"
        GCR_CREDENTIALS = "gcr:internaltools-gcr-credentials"
    }
    stages {
      stage("Building docker image"){
        steps{
            script {
                dockerImage = docker.build("${IMAGE_NAME}")
            }
        }
      }
      stage("tests image") {
        //Running the tests inside the image, all the dependencies are built in the image.
        steps{
            script{
                dockerImage.inside {
                    sh "pip install pytest"
                    sh "pip install --requirement requirements.txt"
                    sh "python3 -m pytest tests"
                }
            }
        }
      }
      stage("Push image") {
        //Lets push the image using the bash as tag
        steps{
            script {
                dockerImage.withRegistry("https://${env.REGISTRY_URL}", "${env.GCR_CREDENTIALS}") {
                    dockerImage.push("${env.GIT_BRANCH}")  
                }
            }
        }
      }
    }
}
