# Awesome Declarative Apps

An awesome list of declarative applications, engines, and platforms.

<!-- toc -->
- [Type - Engine](#type---engine)
  - [terraform](#terraform)
  - [Cuelang](#cuelang)
- [Type - Platform](#type---platform)
  - [kubernetes](#kubernetes)
- [Type - Application](#type---application)
  - [ferret](#ferret)
  - [mkdocs](#mkdocs)
  - [reagent](#reagent)
  - [editly](#editly)
  - [topicctl](#topicctl)
  - [ignition](#ignition)
  - [cabourotte](#cabourotte)
<!-- /toc -->


# Type - Engine

## terraform

**Category:** infrastructure as code

**Url:** https://www.terraform.io/

**Description:** Terraform is an open-source infrastructure as code software tool that provides a consistent CLI workflow to manage hundreds of cloud services. Terraform codifies cloud APIs into declarative configuration files.









## Cuelang

**Category:** Configuration Runtime

**Url:** https://cuelang.org

**Description:** Configure, unify, execute




# Type - Platform


## kubernetes

**Category:** container orchestration

**Url:** https://kubernetes.io/

**Description:** Kubernetes, also known as K8s, is an open-source system for automating deployment, scaling, and management of containerized applications.

<details><summary>Examples</summary>

<p>

Example 0 - Basic Deployment

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












# Type - Application



## ferret

**Category:** web scraping

**Url:** https://github.com/MontFerret/ferret

**Description:** ferret is a web scraping system. It aims to simplify data extraction from the web for UI testing, machine learning, analytics and more.
ferret allows users to focus on the data. It abstracts away the technical details and complexity of underlying technologies using its own declarative language. It is extremely portable, extensible, and fast.


## mkdocs

**Category:** website generator

**Url:** https://www.mkdocs.org/

**Description:** MkDocs is a fast, simple and downright gorgeous static site generator that's geared towards building project documentation. Documentation source files are written in Markdown, and configured with a single YAML configuration file.


## reagent

**Category:** Testing

**Url:** https://github.com/whytheplatypus/reagent

**Description:** A cli and library for declaring what how an API is expected to behave and checking that hypothesis.


## editly

**Category:** Multimedia

**Url:** https://github.com/mifi/editly

**Description:** Editly is a tool and framework for declarative NLE (non-linear video editing) using Node.js and ffmpeg. Editly allows you to easily and programmatically create a video from a set of clips, images, audio and titles, with smooth transitions and music overlaid.
Editly has a simple CLI for quickly assembling a video from a set of clips or images, or you can use its more flexible JavaScript API.


## topicctl

**Category:** Kafka

**Url:** https://github.com/segmentio/topicctl

**Description:** A tool for easy, declarative management of Kafka topics. Includes the ability to "apply" topic changes from YAML as well as a repl for interactive exploration of brokers, topics, consumer groups, messages, and more.


## ignition

**Category:** OS Runtime Configuration

**Url:** https://github.com/kinvolk/ignition

**Description:** Ignition is a low-level system configuration utility. The Ignition executable is part of the temporary initial root filesystem, the initramfs. When Ignition runs, it finds configuration data in a named location for a given environment, such as a file or URL, and applies it to the machine before switch_root is called to pivot to the machine's root filesystem.
Ignition uses a JSON configuration file to represent the set of changes to be made.



## cabourotte

**Category:** Monitoring

**Url:** https://github.com/mcorbin/cabourotte

**Description:** Cabourotte is a tool which allow you to execute healthchecks (HTTP(s), TCP, DNS, TLS) on your infrastructure.


