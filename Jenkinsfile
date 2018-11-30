pipeline {
    agent none
	parameters {
        string(defaultValue: '3', description: 'Version number.', name: 'version')
    }
	environment {
        VERSION = "${params.version}"
    }

    stages {
        stage('Kubernetes tests'){
            steps {
                withKubeConfig([caCertificate: '''
                    MIIDCzCCAfOgAwIBAgIQAr3FqyD+MZadGDybzvIRTjANBgkqhkiG9w0BAQsFADAv
                    MS0wKwYDVQQDEyRkYTFlZDI0My1mM2I0LTRjNDktOTk3Yi1kMGFmYzJiMDVmMGIw
                    HhcNMTgxMTE2MTUwMjU1WhcNMjMxMTE1MTYwMjU1WjAvMS0wKwYDVQQDEyRkYTFl
                    ZDI0My1mM2I0LTRjNDktOTk3Yi1kMGFmYzJiMDVmMGIwggEiMA0GCSqGSIb3DQEB
                    AQUAA4IBDwAwggEKAoIBAQCy+ebUxPvd2fuhAMtlK/2CLir/HqMPulu+vwafpj+O
                    Z2m58cbaB6NKIlTcB4IY6gjiNdyNPiHnOCIYNOPiiUA7s2cgtvLUD7xejQ+3yuOW
                    K9emj+k18SC/lG1F24uHC2L4LjeIQpKiBztMMa6pEucQHXpRl5ocHnV5VZ4d7u/r
                    WqfcSt2JNXUb/6R0YVtF/c6c1JQxgKYqA1ofZMFRvF4zLJbu63dfPNUQpybBEVo7
                    SCl57VJM2vR3k9u1n4QrecKenagX+NTlP3CjkRYK9yg4w391nqSa/U+X2b5zprq3
                    dTZ5J4cxQhOmUM0t1oA/KMMjg8RqglAVX6+zA/wC82LHAgMBAAGjIzAhMA4GA1Ud
                    DwEB/wQEAwICBDAPBgNVHRMBAf8EBTADAQH/MA0GCSqGSIb3DQEBCwUAA4IBAQCU
                    qL16TEDmaFvvBKIr2DSTknkfU6Bp0wX+X9+IKPCuNG6VHsT9qinej9WB0IYImx7h
                    8W8FylGgXfPftkqsB3KuW62Zx0NqIB/jCrOvWt+5CTV+3NC5PZ5HOjUfrKNzo+Jt
                    86DEdSWJA4ynzj508r9oBqjOCUfXb0Dukr/sUm9Z1Dbstu6Dqvj7RSrqW8Og7lF4
                    MTktwrQgwJOfZpsc3RDbOQnh07taNfOtGHv3hBcTH6orj3KnF+rij4pIn8yVATpE
                    hatAGQHtcFkltmZHZg1/qoBQFTrCOGwpeRwSz0AcZaSeUy5U85MbO9JO0GqLkdPC
                    v4XH9+5IuejxCF5SDwtw''',
                    credentialsId: 'internal-tools-cluster-credentials', serverUrl: 'https://35.237.228.119']) {
                        sh 'kubectl get pods'
                    }
            }
        }
	}
}