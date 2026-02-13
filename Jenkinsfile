pipeline {
    agent any

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/lokeshsomasundaram/k3s-infra-terraform.git'
            }
        }

        stage('Terraform Init & Apply') {
            steps {
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'aws-creds'
                ]]) {
                    sh '''
                        terraform init
                        terraform apply -auto-approve
                    '''
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
