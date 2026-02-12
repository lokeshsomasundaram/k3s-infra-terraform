pipeline {
    agent any

    environment {
        // Direct AWS keys for Terraform
        AWS_ACCESS_KEY_ID     = 'AKIARMIW3YGZPLBORU7W'
        AWS_SECRET_ACCESS_KEY = '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'
        AWS_DEFAULT_REGION    = 'ap-south-1'
    }

    stages {
        stage('Checkout Code') {
            steps {
                // SSH Git URL - make sure Jenkins user has SSH key added to GitHub
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
