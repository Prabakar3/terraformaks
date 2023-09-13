pipeline{
    agent any
    tools{
        maven 'm1'
    }
    stages{
         stage('Azure Login') {
            steps {
                withCredentials([azureServicePrincipal(credentialsId: 'AzureServicePrincipal')]) {
                    sh 'az login --service-principal -u 75e37be0-97f6-4e45-8d40-a4db485b6626 -p QvE8Q~.buQwrPNXWE3r2e2Xf-oUikpHSkDNVVc_o -t 5c4c3ab4-7994-41c2-bf07-3b972c97d84c'
                }
            }
        }
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

}
