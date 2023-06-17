@Library('my-shared-library') _

pipeline {

    agent any

    stages {

        stage('git checkout'){

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

            steps{

                script {

                    mvnTest()
                }
            }
        }
        stage('integration test maven'){

            steps{

                script {

                    mvnIntegrationTest()
                }
            }
        }
    }
}