pipeline {
    agent any
    triggers { 
        pollSCM('H/1 * * * *')
    }

    stages {
        stage('Checkout') {
            steps {             
                git branch: 'main', url: 'https://github.com/user/repo.git'
            }
        }
        stage('Build & Test') {
            steps {
                
               echo "تشغيل build و test هنا"
            
                sh 'python3 tests_unitaires.py'
            
                sh 'python3 tests_api.py'
            
                sh 'robot tests_ihm'
            }
        }
    }

    post {
        always {
            echo 
        }
    }
}
