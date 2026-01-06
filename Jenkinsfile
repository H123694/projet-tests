pipeline {
    agent any

    stages {

        stage('Récupération du code') {
            steps {
                git url: 'https://github.com/H123694/projet-tests.git',
                    branch: 'main'
            }
        }

        stage('Tests unitaires') {
            steps {
                echo 'Tests unitaires...'
            }
        }

        stage('Tests API') {
            steps {
                echo 'Tests API...'
            }
        }

        stage('Tests IHM') {
            steps {
                echo 'Tests IHM...'
            }
        }
    }

    post {
        failure {
            echo 'Au moins un test a échoué'
        }
    }
}
