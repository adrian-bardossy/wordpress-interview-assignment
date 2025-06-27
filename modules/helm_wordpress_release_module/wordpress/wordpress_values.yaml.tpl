replicaCount: 2

externalDatabase:
  host: "${db_host}"
  name: "${db_name}"
  user: "${db_user}"
  password: "${db_password}"

wordpressPassword: "${wordpress_admin_password}"
extraEnvVars:
  - name: WORDPRESS_DB_USER
    value: "${db_user}"
  - name: WORDPRESS_DB_PASSWORD
    value: "${db_password}"
  - name: WORDPRESS_PASSWORD
    value: "${wordpress_admin_password}"

ingress:
  enabled: true
  ingressClassName: "nginx"
  hostname: "${hostname}"
  tls: 
    - secretName: "${tls_secret_name}"
      hosts:
        - "${hostname}"

tolerations:
  - key: "dedicated"
    operator: "Equal"
    value: "wordpress"
    effect: "NoSchedule"

affinity:
  nodeAffinity:
    requiredDuringSchedulingIgnoredDuringExecution:
      nodeSelectorTerms:
        - matchExpressions:
            - key: dedicated
              operator: In
              values:
                - wordpress

podAffinityPreset: soft
podAntiAffinityPreset: hard

autoscaling:
  enabled: true
  minReplicas: 2
  maxReplicas: 5
  targetCPUUtilizationPercentage: 80
  averageRelativeMemory: 70
