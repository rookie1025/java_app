pipeline {

    agent any

    stages {

        stage('git checkout'){

            steps {

                script {

                    git branch: 'main', url: 'https://github.com/rookie1025/java_app.git'
                }
            }
        }
    }
}