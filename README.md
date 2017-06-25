This was based on @wernight`s tool, see https://github.com/wernight/docker-kubectl for more details

*We added the `envsubst` command to allow to have a simplistic templating mechanism:*

`envsubst` replaces shell-like variable expressions with current values
of environment variables:

```echo '$PWD' | envsubst ``` will result in the same output as ```echo $PWD```

by `envsubst` in our Jenkins build job, similar to

```#!/bin/bash
cat any-k8s-resources/deployment.yml | envsubst | kubectl apply -'
```

## complete example:
```{groovy}
node('docker') {
  docker.inside('skylo/kubectl', '-e K8S-DOCKER-IMAGE=skylo/kubectl:1.6.1') {
    // add specific config from jenkins workspace into the correct location for use by kubectl
    sh 'cp .kubeconfig /config/.kube/'
    
    // pre-check if connections works:
    sh 'kubectl cluster-info'
    
    // this allows to replace shell-like variable expression by current environment by envsubs, e.g.
    //    `$K8S-DOCKER-IMAGE`   by   `skylo/kubectl:1.6.1`
    sh 'cat k8s-resources/deployment.yml | envsubst | kubectl apply -'
 }
}
```

# Supported tags and respective `Dockerfile` links

  * [`latest` (1.6.1)](https://github.com/lowsky/docker-kubectl/blob/master/Dockerfile)
[![](https://images.microbadger.com/badges/version/skylo/kubectl.svg)](https://microbadger.com/images/skylo/kubectl "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/skylo/kubectl.svg)](https://microbadger.com/images/skylo/kubectl "Get your own image badge on microbadger.com")

  * [`1.6.1`](https://github.com/lowsky/docker-kubectl/blob/1.6.1/Dockerfile) 
[![](https://images.microbadger.com/badges/version/skylo/kubectl:1.6.1.svg)](https://microbadger.com/images/skylo/kubectl:1.6.1 "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/skylo/kubectl:1.6.1.svg)](https://microbadger.com/images/skylo/kubectl:1.6.1 "Get your own image badge on microbadger.com")

