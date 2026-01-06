pipeline {
    agent any

    triggers {
        // Poll SCM every minute
        pollSCM('* * * * *')
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout Git repository
                git branch: 'main', url: 'https://github.com/H123694/projet-tests'
            }
        }

        stage('Test') {
            steps {
                // Echo must contain text to avoid compilation error
                echo "SCM Polling works! Pipeline is running."
                
                // Examples to run tests (uncomment if needed)
                // sh 'python3 tests_unitaires.py'
                // sh 'python3 tests_api.py'
                // sh 'robot tests_ihm'
            }
        }
    }

    post {
        always {
            echo "Pipeline finished."
        }
    }
}
