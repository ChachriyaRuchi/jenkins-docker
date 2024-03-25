pipeline{

    agent any
    tools{
        maven "maven"
    }
    stages{
        stage("SCM checkout"){
            steps{
              checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/ChachriyaRuchi/jenkins-docker.git']])
            }

        }

        stage("Build Process"){
            steps{
                script{
                   bat 'mvn clean install'
                }
            }

    }
        stage("Build Image"){
                   steps{
                       script{
                           bat 'docker build -t ruchichachriya/spring-cicd:1.0 .'
                       }
                   }
               }



    }
     post{
        always{
            emailext attachLog: true,
            body: ''' <html>
    <body>
        <p>Build Status: ${BUILD_STATUS}</p>
        <p>Build Number: ${BUILD_NUMBER}</p>
        <p>Check the <a href="${BUILD_URL}">console output</a>.</p>
    </body>
</html>''', mimeType: 'text/html', replyTo: 'ruchichachriya@gmail.com', subject: 'Pipeline Status : ${BUILD_NUMBER}', to: 'ruchi.xworkz@gmail.com'

        }
    }
}