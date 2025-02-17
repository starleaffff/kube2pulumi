resource defaultArgocd_serverDeployment "kubernetes:apps/v1:Deployment" {
apiVersion = "apps/v1"
kind = "Deployment"
metadata = {
annotations = {
"deployment.kubernetes.io/revision" = "1"
"kubectl.kubernetes.io/last-applied-configuration" = <<EOF
{"apiVersion":"apps/v1","kind":"Deployment","metadata":{"labels":{"app.kubernetes.io/component":"server","app.kubernetes.io/instance":"argocd","app.kubernetes.io/managed-by":"pulumi","app.kubernetes.io/name":"argocd-server","app.kubernetes.io/part-of":"argocd","app.kubernetes.io/version":"v1.6.1","helm.sh/chart":"argo-cd-2.5.4"},"name":"argocd-server","namespace":"default"},"spec":{"replicas":1,"revisionHistoryLimit":5,"selector":{"matchLabels":{"app.kubernetes.io/instance":"argocd","app.kubernetes.io/name":"argocd-server"}},"template":{"metadata":{"labels":{"app.kubernetes.io/component":"server","app.kubernetes.io/instance":"argocd","app.kubernetes.io/managed-by":"Helm","app.kubernetes.io/name":"argocd-server","app.kubernetes.io/part-of":"argocd","app.kubernetes.io/version":"v1.6.1","helm.sh/chart":"argo-cd-2.5.4"}},"spec":{"containers":[{"command":["argocd-server","--staticassets","/shared/app","--repo-server","argocd-repo-server:8081","--dex-server","http://argocd-dex-server:5556","--loglevel","info","--redis","argocd-redis:6379"],"image":"argoproj/argocd:v1.6.1","imagePullPolicy":"IfNotPresent","livenessProbe":{"failureThreshold":3,"httpGet":{"path":"/healthz","port":8080},"initialDelaySeconds":10,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":1},"name":"server","ports":[{"containerPort":8080,"name":"server","protocol":"TCP"}],"readinessProbe":{"failureThreshold":3,"httpGet":{"path":"/healthz","port":8080},"initialDelaySeconds":10,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":1},"resources":{},"volumeMounts":[{"mountPath":"/app/config/ssh","name":"ssh-known-hosts"}]}],"serviceAccountName":"argocd-server","volumes":[{"emptyDir":{},"name":"static-files"},{"configMap":{"name":"argocd-ssh-known-hosts-cm"},"name":"ssh-known-hosts"}]}}}}
EOF
}
creationTimestamp = "2020-08-04T18:50:43Z"
generation = 1
labels = {
"app.kubernetes.io/component" = "server"
"app.kubernetes.io/instance" = "argocd"
"app.kubernetes.io/managed-by" = "pulumi"
"app.kubernetes.io/name" = "argocd-server"
"app.kubernetes.io/part-of" = "argocd"
"app.kubernetes.io/version" = "v1.6.1"
"helm.sh/chart" = "argo-cd-2.5.4"
}
name = "argocd-server"
namespace = "default"
resourceVersion = "1406"
selfLink = "/apis/apps/v1/namespaces/default/deployments/argocd-server"
uid = "4b806e77-b035-41a3-bdf9-9781b76445f9"
}
spec = {
progressDeadlineSeconds = 600
replicas = 1
revisionHistoryLimit = 5
selector = {
matchLabels = {
"app.kubernetes.io/instance" = "argocd"
"app.kubernetes.io/name" = "argocd-server"
}
}
strategy = {
rollingUpdate = {
maxSurge = "25%"
maxUnavailable = "25%"
}
type = "RollingUpdate"
}
template = {
metadata = {
creationTimestamp = null
labels = {
"app.kubernetes.io/component" = "server"
"app.kubernetes.io/instance" = "argocd"
"app.kubernetes.io/managed-by" = "Helm"
"app.kubernetes.io/name" = "argocd-server"
"app.kubernetes.io/part-of" = "argocd"
"app.kubernetes.io/version" = "v1.6.1"
"helm.sh/chart" = "argo-cd-2.5.4"
}
}
spec = {
containers = [
{
command = [
"argocd-server",
"--staticassets",
"/shared/app",
"--repo-server",
"argocd-repo-server:8081",
"--dex-server",
"http://argocd-dex-server:5556",
"--loglevel",
"info",
"--redis",
"argocd-redis:6379"
]
image = "argoproj/argocd:v1.6.1"
imagePullPolicy = "IfNotPresent"
livenessProbe = {
failureThreshold = 3
httpGet = {
path = "/healthz"
port = 8080
scheme = "HTTP"
}
initialDelaySeconds = 10
periodSeconds = 10
successThreshold = 1
timeoutSeconds = 1
}
name = "server"
ports = [
{
containerPort = 8080
name = "server"
protocol = "TCP"
}
]
readinessProbe = {
failureThreshold = 3
httpGet = {
path = "/healthz"
port = 8080
scheme = "HTTP"
}
initialDelaySeconds = 10
periodSeconds = 10
successThreshold = 1
timeoutSeconds = 1
}
resources = {
}
terminationMessagePath = "/dev/termination-log"
terminationMessagePolicy = "File"
volumeMounts = [
{
mountPath = "/app/config/ssh"
name = "ssh-known-hosts"
}
]
}
]
dnsPolicy = "ClusterFirst"
restartPolicy = "Always"
schedulerName = "default-scheduler"
securityContext = {
}
serviceAccount = "argocd-server"
serviceAccountName = "argocd-server"
terminationGracePeriodSeconds = 30
volumes = [
{
emptyDir = {
}
name = "static-files"
},
{
configMap = {
defaultMode = 420
name = "argocd-ssh-known-hosts-cm"
}
name = "ssh-known-hosts"
}
]
}
}
}
}
