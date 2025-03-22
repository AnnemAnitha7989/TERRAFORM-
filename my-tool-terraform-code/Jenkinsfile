pipeline {
    agent any
    
    tools {
        // Terraform plugin installation
        terraform 'terraform'
    }
    parameters {
        choice(
            choices: ['Create Infra', 'Destroy Infra'], 
            description: 'Select whether to create or destroy the infrastructure:',
            name: 'ACTION'
        )
    }
    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws_access_key_id')
        AWS_SECRET_ACCESS_KEY = credentials('aws_secret_access_key')
    }
    stages {
        stage('Terraform init') {
            steps {
                sh 'terraform init'
            }
        }
        stage('Terraform plan') {
            steps {
                sh 'terraform plan'
            }
        }
        // stage to apply OR destroy infra
        stage('Proceed with Terraform action') {
            input {
                message "Do you want to ${params.ACTION == 'Create Infra' ? 'apply' : 'Destroy Infra'} ?"
                ok "Yes"
            }
            steps {
                script {
                    def action = params.ACTION
                    switch (action) {
                        case 'Create Infra':
                            sh 'terraform apply --auto-approve'
                            break
                        case 'Destroy Infra':
                            sh 'terraform destroy --auto-approve'
                            break
                    }
                }
            }
        }
    }
}
