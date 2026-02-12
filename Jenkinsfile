pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = 'AKIARMIW3YGZPLBORU7W'
        AWS_SECRET_ACCESS_KEY = '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'
        AWS_DEFAULT_REGION    = 'ap-south-1'
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/lokeshsomasundaram/k3s-infra-terraform.git'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }

        stage('Save kubeconfig') {
            steps {
                // Copy kubeconfig from terraform folder and stash it
                sh 'cp terraform-k3s/kubeconfig ./k3s.yaml'
                stash includes: 'k3s.yaml', name: 'k3s-config'
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
