node {
    stage('Checkout') {
        checkout scm
    }

    stage('Build') {
        sh 'python3 -m py_compile sources/add2vals.py sources/calc.py'
    }

    stage('Test') {
        sh 'chmod +x ./jenkins/scripts/test.sh'
        sh './jenkins/scripts/test.sh'
        junit 'test-reports/results.xml'
    }

    stage('Manual Approval') {
        input message: 'Lanjutkan ke tahap Deploy?', ok: 'Proceed'
    }

    stage('Deploy') {
        sh 'chmod +x ./jenkins/scripts/deliver.sh'
        sh './jenkins/scripts/deliver.sh'
        
        echo 'Aplikasi berhasil di-deploy. Menjeda eksekusi selama 1 menit...'
        sh 'sleep 60'
        
        sh 'chmod +x ./jenkins/scripts/kill.sh'
        sh './jenkins/scripts/kill.sh'
        
        archiveArtifacts artifacts: 'dist/add2vals', fingerprint: true
    }
}