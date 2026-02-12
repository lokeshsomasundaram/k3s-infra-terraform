pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
        AWS_DEFAULT_REGION    = 'ap-south-1'
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main',
                    url: 'git@github.com:lokeshsomasundaram/k3s-infra-terraform.git'
            }
        }

        stage('Terraform Init') {
            steps {
                dir('terraform-k3s') {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                dir('terraform-k3s') {
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }

    post {
        success {
            echo '✅ Infrastructure applied successfully!'
        }
        failure {
            echo '❌ Terraform failed!'
        }
    }
}
