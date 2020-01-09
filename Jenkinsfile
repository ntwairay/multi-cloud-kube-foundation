#!groovy​

pipeline {
  agent {
    kubernetes {
        label 'pod'
        defaultContainer 'jnlp'
        yaml """
apiVersion: v1
kind: Pod
metadata:
  labels:
    label: k8-pods
spec:
  containers:
  - name: deployer
    image: 978515198440.dkr.ecr.ap-southeast-2.amazonaws.com/ci-kubernetes-deploy:latest
    command:
    - cat
    tty: true
    alwaysPullImage: true
"""
    }
  }
  stages {
    stage('Deploy from master') {
      when {
        branch 'master'
      }

      stages {
        stage('kustomize') {
          steps {
            container('deployer') {
              withAWS(credentials: 'aws-shared-credential') {
                sh """
                  kustomize build resources/environments/cluster01.shared.firstwave.cloud/ | kubectl apply -f -
                """
              }
            }
          }
        }

        stage('kubesec') {
          steps {
            container('deployer') {
              withAWS(credentials: 'aws-shared-credential') {
                sh """
                  find ./secrets/cluster01.shared.firstwave.cloud -name "*.yaml" -exec sh -c "kubesec decrypt {} | kubectl apply -f -" \\;
                """
              }
            }
          }
        }

        stage('helmfile') {
          steps {
            container('deployer') {
              withAWS(credentials: 'aws-shared-credential') {
                dir('helm') {
                  sh """
                    helmfile --version
                    helmfile sync
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
