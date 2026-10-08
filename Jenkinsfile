node {
    stage('Build') {
        sh 'python -m py_compile sources/add2vals.py sources/calc.py'
    }

    stage('Test') {
        sh 'chmod +x ./jenkins/scripts/test.sh'
        sh './jenkins/scripts/test.sh'
        junit 'test-reports/results.xml'
    }

    stage('Deliver') {
        sh 'chmod +x ./jenkins/scripts/deliver.sh'
        sh './jenkins/scripts/deliver.sh'
        archiveArtifacts artifacts: 'dist/add2vals', fingerprint: true
    }
}