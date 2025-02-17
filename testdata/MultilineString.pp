resource kube_systemCorednsConfigMap "kubernetes:core/v1:ConfigMap" {
apiVersion = "v1"
kind = "ConfigMap"
metadata = {
name = "coredns"
namespace = "kube-system"
}
data = {
Corefile = <<EOF
.:53 {
        errors
        health {
          lameduck 5s
        }
        ready
        kubernetes CLUSTER_DOMAIN REVERSE_CIDRS {
          fallthrough in-addr.arpa ip6.arpa
        }
        prometheus :9153
        forward . UPSTREAMNAMESERVER {
          max_concurrent 1000
        }
        cache 30
        loop
        reload
        loadbalance
    }STUBDOMAINS
EOF
}
}
