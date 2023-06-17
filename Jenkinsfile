@Library('my-shared-library') _

pipeline {

    agent any

    parameters{
        
        choice(name: 'action', choices: 'create\ndelete', description: 'choose create/destroy')
    }

    stages {

        stage('git checkout'){

            when { expression { params.actions == 'create' } }

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

            when { expression { params.actions == 'create' } }

            steps{

                script {

                    mvnTest()
                }
            }
        }

        stage('integration test maven'){

            when { expression { params.actions == 'create' } }

            steps{

                script {

                    mvnIntegrationTest()
                }
            }
        }

        stage('Static code analysis: Sonarqube'){

            when { expression { params.actions == 'create' } }

            steps{

                script {

                    staticCodeAnalysis()
                }
            }
        }
    }
}