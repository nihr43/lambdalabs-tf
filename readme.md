# usage

Create an api token in the webui and set the following env var:

```
export TF_VAR_LAMBDA_TOKEN=asdf1234
```

An ephemeral ssh key will be generated to be used with the instance:

```
output "ssh_hint" {
  value = "ssh -i id.rsa ubuntu@${lambdalabs_instance.default.ip}"
}
```
