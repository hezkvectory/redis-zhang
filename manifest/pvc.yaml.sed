kind: PersistentVolumeClaim
apiVersion: v1
metadata:
  name: {{.claim.name}} 
  namespace: {{.namespace}}
  labels:
    {{.labels.key}}: {{.labels.value}}
  annotations:
    volume.beta.kubernetes.io/storage-class: "slow"
    #volume.beta.kubernetes.io/storage-class: "{{.storageclass.name}}"
spec:
  accessModes:
    #- ReadWriteOnce
    - ReadWriteMany
  resources:
    requests:
      storage: 4Gi
