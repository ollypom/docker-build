node("docker") {
    docker.withRegistry('https://52.56.228.3', '73b866c0-867a-463d-babc-f5d49ce6abb9') {
    
        git url: "https://github.com/ollypom/docker-build.git", credentialsId: 'd3f7ca2b-c6e7-464c-9723-e90f4bbacaf7'
    
        sh "git rev-parse HEAD > .git/commit-id"
        def commit_id = readFile('.git/commit-id').trim()
        println commit_id
    
        stage "build"
        def app = docker.build "admin/test"
    
        stage "publish"
        app.push "${commit_id}"
        app.push 'latest'

        stage "deploy"
        sh "export DOCKER_TLS_VERIFY=1 && export DOCKER_CERT_PATH=/ && DOCKER_HOST=tcp://52.56.242.202:443 && \
        docker stack deploy -c stack.yml nginxtest"
    }
}
