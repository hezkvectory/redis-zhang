apiVersion: v1
kind: Service
metadata:
  namespace: {{.namespace}}
  labels:
    component: {{.name}} 
    {{.labels.key}}: {{.labels.value}}
  name: {{.name}}
spec:
  type: NodePort
  selector:
    component: {{.name}}
  ports:
    - port: 6379 
      targetPort: 6379 
      nodePort: 16379
      name: redis 
