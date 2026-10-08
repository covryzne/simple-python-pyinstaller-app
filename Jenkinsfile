node {
    docker.image('python:3-alpine').inside {
        stage('Build') {
            sh 'python -m py_compile sources/add2vals.py sources/calc.py'
        }

        stage('Test') {
            sh 'pip install pytest'
            sh 'chmod +x ./jenkins/scripts/test.sh'
            sh './jenkins/scripts/test.sh'
            junit 'test-reports/results.xml'
        }

        stage('Deliver') {
            sh 'pip install pyinstaller'
            sh 'chmod +x ./jenkins/scripts/deliver.sh'
            sh './jenkins/scripts/deliver.sh'
            archiveArtifacts artifacts: 'dist/add2vals', fingerprint: true
        }
    }
}