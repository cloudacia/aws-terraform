pipeline {
    agent any

    parameters {

        booleanParam(name: 'destroy',
                    defaultValue: false,
                    description: 'Destroy Terraform build?')
    }

     environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }

    stages {
        stage('checkout') {
            steps {
              git "https://github.com/cloudacia/1-aws-terraform-load-balanced-website.git"
              }
            }

        stage('init') {
            steps {
                sh 'terraform init -input=false'
            }
        }

        stage('validate') {
          steps{
            sh 'terraform validate'
          }
        }

        stage('plan') {
          steps{
            sh 'terraform plan -input=false -out tfplan -lock=false'
          }
        }

        stage('apply') {
          steps{
            sh 'terraform apply -auto-approve'
          }
        }

        stage('Destroy') {
            when {
                equals expected: true, actual: params.destroy
            }

        steps {
           sh "terraform destroy --auto-approve"
          }
        }
      }
    }
