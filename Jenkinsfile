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
        input message: 'Lanjutkan ke tahap Deploy ke AWS EC2?', ok: 'Proceed'
    }

    stage('Deploy') {
        sh 'chmod +x ./jenkins/scripts/deliver.sh'
        sh './jenkins/scripts/deliver.sh'

        // Otomatis ngirim artifact ke EC2 & mengeksekusinya
        sshagent(credentials: ['ec2-ssh-key']) {
            sh '''
                ssh -o StrictHostKeyChecking=no ubuntu@${EC2_PUBLIC_IP} "mkdir -p ~/app"
                scp -o StrictHostKeyChecking=no dist/add2vals ubuntu@${EC2_PUBLIC_IP}:~/app/add2vals
                ssh -o StrictHostKeyChecking=no ubuntu@${EC2_PUBLIC_IP} "chmod +x ~/app/add2vals && ~/app/add2vals 10 20"
            '''
        }

        echo 'Aplikasi berhasil dikirim dan dieksekusi di AWS EC2. Menjeda eksekusi 60 detik...'
        sh 'sleep 60'

        sh 'chmod +x ./jenkins/scripts/kill.sh'
        sh './jenkins/scripts/kill.sh'

        archiveArtifacts artifacts: 'dist/add2vals', fingerprint: true
    }
}