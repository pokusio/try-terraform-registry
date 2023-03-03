# Try Terraform Registry

git@github.com:nrkno/terraform-registry.git


## PRepare System 

### Install golang

On Debian :

```bash
chmod +x ./shell/golang-install.sh
./shell/golang-install.sh
```

* install build toolbox including make : 

```bash
sudo apt-get install -y build-essential
```

## Run


```bash

git clone git@github.com:nrkno/terraform-registry.git
cd terrform-registry

# docker run --name terraform-registry-service -itd -P --restart=always terraform-registry /bin/bash

docker run --name terraform-registry-service -itd -P  --restart=always terraform-registry

docker run --name terraform-registry-service -itd -P terraform-registry


export GITHUB_TOKEN="ghp_XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
alias terragistries="docker run -it -e GITHUB_TOKEN=${GITHUB_TOKEN} -p 0.0.0.0:8080:8080 terraform-registry"

terragistries -help
terragistries -version

# ---
#>>>> ohhhh and this is connected with https://github.com/pokusio/terragistries as storage !
terragistries -auth-disabled -store github -github-owner-filter pokusio -github-topic-filter terragistries

```
