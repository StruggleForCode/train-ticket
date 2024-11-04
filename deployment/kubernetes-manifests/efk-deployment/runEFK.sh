# label all nodes in the cluster
echo '***Label all nodes in the cluster***'
kubectl label node `kubectl get node | awk 'NR == 1 {next}{print $1}'` beta.kubernetes.io/fluentd-ds-ready=true

# apply all resource files in current directory
echo '***Deploy EFK(elasticsearch、fluentd、kibana)***'
kubectl apply -f .

# get master IP address ---var3
var1=`kubectl cluster-info | awk 'NR == 1 {print $7}'`
var2=${var1#*//}
var3=${var2%:*}

echo "var1: $var1"
echo "var2: $var2"
echo "var3: $var3"

# expose the kibana service by proxy
echo '***Expose Kibana service on masterIP:8086***'
kubectl proxy --address=${var3} --port=8086 --accept-hosts='^*$'
