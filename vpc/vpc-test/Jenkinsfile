pipeline {
    agent any

    options {
        disableConcurrentBuilds()
        timeout(time: 1,unit: 'HOURS') 
    }

    parameters{
         choice(name: 'Action', choices: ['apply','destroy'], description: 'Pick something')
    }

    stages {
        stage("init stage") {
            when {
                expression {
                    params.Action == 'apply'
                }
            }
            steps {
                sh"""
                    cd vpc
                    cd vpc-test
                    terraform init -reconfigure
                """
            }
        }

        stage("Plan stage") {
            when {
                expression {
                    params.Action == 'apply'
                }
            }
            steps{
                sh """
                    cd vpc
                    cd vpc-test
                    terraform plan
                """
            }
        }

        stage("apply stage") {
            when {
                expression {
                   params.Action == 'apply'
                }
            }
            input {
                message "Should we continue?"
                ok "Yes, we should."
            } 
            steps {
                sh """
                    cd vpc
                    cd vpc-test
                    terraform apply -auto-approve
                """
            }
        }

        stage("Destroy") {
            when {
                expression {
                    params.Action == 'destroy'
                }
            }
            steps {
                sh """
                    cd vpc
                    cd vpc-test
                    terrafrom destroy -autp-approve
                """
            }
        }
    }

    post{

        always {
            echo "This will execute always"
        }

        success {
            echo "Hey this pipleline execute successfully"
        }

        failure {
            echo "hey this pipleline not executed as planned "
        }
    }
}