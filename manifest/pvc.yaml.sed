kind: PersistentVolumeClaim
apiVersion: v1
metadata:
  name: {{.claim.name}} 
  namespace: {{.namespace}}
  labels:
    {{.labels.key}}: {{.labels.value}}
spec:
  accessModes:
    #- ReadWriteOnce
    - ReadWriteMany
  resources:
    requests:
      storage: 4Gi
  storageClassName: nfs-storage
