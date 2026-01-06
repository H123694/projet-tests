pipeline {
    agent any

    triggers {
        pollSCM('* * * * *')
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/H123694/projet-tests'
            }
        }

        stage('API Tests (Robot)') {
            steps {
                echo "Running API tests..."
                bat 'lancer_tests_api.bat'
            }
        }

        stage('IHM Tests (Robot)') {
            steps {
                echo "Running IHM tests..."
                bat 'lancer_tests_ihm.bat'
            }
        }

        stage('Unit Tests (Python)') {
            steps {
                echo "Running unit tests..."
                bat 'lancer_tests_unitaire.bat'
            }
        }

    }

    post {
        always {
            echo "All tests executed."
        }
        success {
            echo "PIPELINE SUCCESS"
        }
        failure {
            echo "PIPELINE FAILED"
        }
    }
}
