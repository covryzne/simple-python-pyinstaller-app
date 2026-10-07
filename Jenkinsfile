node {
    stage('Build') {
        docker.image('python:3-alpine').inside {
            sh 'python -m py_compile sources/add2vals.py sources/calc.py'
        }
    }
    stage('Test') {
        docker.image('python:3-alpine').inside {
            sh 'python -m unittest tests/test_add2vals.py'
        }
    }
    stage('Deliver') {
        docker.image('python:3-alpine').inside {
            sh './jenkins/scripts/deliver.sh'
        }
    }
}