@my-shared-library

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
    }
}