pipeline{
    agent any
    environment {
        name= 'Durga' // we can define "ENV" there so that we can access those env value with in the pipeline
    }

    options {
        //timeout(time: 1, unit: 'SECONDS') // it defines with in give time pipleline need to execute , It not pipeline will mark as ABORTED
        disableConcurrentBuilds() // if you specify this option then we can't build this pipleline twice at same time 
    }

    stages{
        stage("1st stage"){
            steps{
                echo "hello from 1st"
            }
        }

        stage("2nd stage"){
            steps{
                echo "hello from 2nd"
            }
        }

        stage("3rd stage"){
            steps{
                sh """ 
                    echo "Hello from 3rd state"
                    echo "Printing env $name"
                    sleep 10 
                """
            }
        }
        stage("4rd stage"){
            steps{
                echo "hello from 4th "
            }
        }
    }
    
    post{
        always{
            echo "This will execute always"
        }

        success{
            echo " This will execute only on success"
        }

        failure{
            echo "This will execute when pipeline failes"
        }
    }
}


nexusArtifactUploader(
        nexusVersion: 'nexus3',
        protocol: 'http',
        nexusUrl: 'my.nexus.address',
        groupId: 'com.example',
        version: version,
        repository: 'RepositoryName',
        credentialsId: 'CredentialsId',
        artifacts: [
            [artifactId: projectName,
             classifier: '',
             file: 'my-service-' + version + '.jar',
             type: 'jar']
        ]
     )