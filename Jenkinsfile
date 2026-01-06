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

        stage('Run Robot Tests') {
            steps {
                echo "Running Robot Framework tests..."

                // Go to Robot project folder
                dir('PROJET TESTS') {
                    bat 'robot .'
                }
            }
        }
    }

    post {
        always {
            echo "Pipeline finished."
        }
    }
}
