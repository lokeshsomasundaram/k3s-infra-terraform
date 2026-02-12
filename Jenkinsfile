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

        stage('Use Existing K3s kubeconfig') {
            steps {
                // Copy kubeconfig from the node (existing cluster)
                sh 'sudo cp /etc/rancher/k3s/k3s.yaml ./k3s.yaml'
                sh 'sudo chown $(whoami):$(whoami) ./k3s.yaml'
                
                // Stash for app pipeline
                stash includes: 'k3s.yaml', name: 'k3s-config'
            }
        }
    }

    post {
        success {
            echo '✅ Infrastructure applied successfully (or already exists)!'
        }
        failure {
            echo '❌ Terraform failed!'
        }
    }
}
