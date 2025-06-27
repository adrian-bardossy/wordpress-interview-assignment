externalDatabase:
  host: "${db_host}"
  name: "${db_name}"
  user: "${db_user}"
  password: "${db_password}"

extraEnvVars:
  - name: WORDPRESS_DB_USER
    value: "${db_user}"
  - name: WORDPRESS_DB_PASSWORD
    value: "${db_password}"
