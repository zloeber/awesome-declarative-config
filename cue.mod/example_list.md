# Example List Output
Below is a mock up of the expected output for one awesome-list spec:entries element named `kubernetes`

## Type - Platform

### Category - container orchestration

**[kubernetes](https://kubernetes.io/)** - Kubernetes, also known as K8s, is an open-source system for automating deployment, scaling, and management of containerized applications.


<details><summary>Examples</summary>
<p>

#### basic deployment

A replica set of 3 pods will be deployed to Kubernetes. Each pod will run the nginx:1.7.9 container image exposing port 80 and be labeled with `app:nginx` for use in service abstraction.

```
apiVersion: apps/v1
kind: Deployment
metadata:
name: nginx-deployment
labels:
    app: nginx
spec:
replicas: 3
selector:
    matchLabels:
    app: nginx
template:
    metadata:
    labels:
        app: nginx
    spec:
    containers:
    - name: nginx
        image: nginx:1.7.9
        ports:
        - containerPort: 80
```
</p>
</details>