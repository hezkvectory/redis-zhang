apiVersion: apps/v1beta1
kind: StatefulSet
metadata:
  namespace: {{.namespace}}
  name: {{.name}}
  labels:
    {{.labels.key}}: {{.labels.value}}
spec:
  serviceName: "{{.name}}"
  podManagementPolicy: Parallel
  replicas: 1
  template:
    metadata:
      labels:
        component: {{.name}}
        {{.labels.key}}: {{.labels.value}}
    spec:
      terminationGracePeriodSeconds: 10
      containers:
        - name: {{.name}}
          image: {{.image}}
          imagePullPolicy: {{.image.pull.policy}}
          env:
            - name: POD_IP
              valueFrom:
                fieldRef:
                  fieldPath: status.podIP
            - name: POD_NAMESPACE
              valueFrom:
                fieldRef:
                  fieldPath: metadata.namespace
          command:
            - redis-server
          args:
            - /usr/local/etc/redis/redis.conf 
          ports:
            - containerPort: 6379 
          volumeMounts:
            - name: host-time
              mountPath: /etc/localtime
              readOnly: true
            - name: data 
              mountPath: /data 
            - name: config 
              mountPath: /usr/local/etc/redis/redis.conf 
              subPath: redis.conf 
              readOnly: true
      volumes:
        - name: host-time
          hostPath:
            path: /etc/localtime
        - name: data 
          persistentVolumeClaim:
            claimName: {{.claim.name}}
        - name: config 
          configMap:
            name: {{.cm.name}}
