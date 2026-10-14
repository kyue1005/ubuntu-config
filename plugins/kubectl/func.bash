function ksocat() {
  if [ -z "$1" ]; then
    echo "Usage: ksocat <id> <target-host> <target-port> <local-port>"
    return 1
  fi

  kubectl delete po "socat-$1" --ignore-not-found

  kubectl run "socat-$1" --image=alpine/socat -- "TCP-LISTEN:$4,fork" "TCP:$2:$3" && \
  kubectl wait --for=condition=Ready "pod/socat-$1" && \
  kubectl port-forward "socat-$1" "$4:$4"
}
