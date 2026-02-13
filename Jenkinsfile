pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = 'AKIARMIW3YGZPLBORU7W'
        AWS_SECRET_ACCESS_KEY = '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'
        AWS_DEFAULT_REGION    = 'ap-southeast-1'
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
                // Run terraform in root of repo (no terraform-k3s subfolder)
                sh 'terraform init'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve'
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
