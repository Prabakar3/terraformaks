pipeline{
    agent any
    tools{
        maven 'm1'
    }
    stages{
        stage('Terraform Init and Apply'){
            steps{
                script {
                    // Initialize Terraform
                    sh 'terraform init'

                    // Validate the Terraform configuration files
                    sh 'terraform validate'

                    // Plan and Apply
                    sh 'terraform plan -out=tfplan'
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }
    }
