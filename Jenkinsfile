@Library('my-shared-library') _

pipeline {

    agent any

    parameters{
        
        choice(name: 'action', choices: 'create\ndelete', description: 'choose create/destroy')
        string(name: 'ImageName', description: "name of the docker build", defaultValue: "javaapp")
        string(name: 'ImageTag', description: "tag of the docker build", defaultValue: "v1")
        string(name: 'DockerHubUser', description: "name of the application", defaultValue: "rookie1025")
    }

    stages {

        stage('git checkout'){

            when { expression {  params.action == 'create' } }

            steps {

                script {

                    gitCheckout(

                        branch: "master",
                        url: "https://github.com/rookie1025/java_app.git"
                    )
                }
            }
        }

        stage('unit test maven'){

        when { expression {  params.action == 'create' } }

            steps{

                script {

                    mvnTest()
                }
            }
        }

        stage('integration test maven'){

            when { expression {  params.action == 'create' } }

            steps{

                script {

                    mvnIntegrationTest()
                }
            }
        }

        stage('Static code analysis: Sonarqube'){

            when { expression {  params.action == 'create' } }

            steps{

                script {
                    
                    def SonarqubecredentialsId = 'sonarqube-api'
                    staticCodeAnalysis(SonarqubecredentialsId)
                }
            }
        }

        stage('Quality Gate Status: Sonarqube'){

            when { expression {  params.action == 'create' } }

            steps{

                script {
                    
                    def SonarqubecredentialsId = 'sonarqube-api'
                    qualityGateStatus(SonarqubecredentialsId)
                }
            }
        }

        stage('Maven Build: Maven'){

            when { expression {  params.action == 'create' } }

            steps{

                script {
                    
                   mvnBuild()

                }
            }
        }

        stage('Docker Image Build'){

            when { expression {  params.action == 'create' } }

            steps{

                script {
                    
                   dockerBuild("${params.ImageName}", "${params.ImageTag}", "${params.DockerHubUser}" )

                }
            }
        }

        stage('Docker Image Scan: Trivy'){

            when { expression {  params.action == 'create' } }

            steps{

                script {
                    
                   dockerImageScan("${params.ImageName}", "${params.ImageTag}", "${params.DockerHubUser}" )

                }
            }
        }

        stage('Docker Image Push: DockerHub'){

            when { expression {  params.action == 'create' } }

            steps{

                script {
                    
                   dockerImagePush("${params.ImageName}", "${params.ImageTag}", "${params.DockerHubUser}" )

                }
            }
        }




    }
}