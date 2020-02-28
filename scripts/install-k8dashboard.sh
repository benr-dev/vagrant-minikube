#!/bin/bash
echo "**** Begin preparing dashboard"

kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0-beta8/aio/deploy/recommended.yaml
# Proxy port 8001 allowing local dashboard access
# http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/
echo "To use dashboard: vagrant ssh -c \"kubectl proxy --address='0.0.0.0' --port=8001\""

echo "**** End preparing dashboard"