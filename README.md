An awesome list of declaratively configured applications and engines.

<!-- toc -->
  - [Introduction](#introduction)
- [Understanding Declarative Configuration](#understanding-declarative-configuration)
  - [Benefits](#benefits)
  - [Drawbacks](#drawbacks)
  - [Declarative Categories](#declarative-categories)
  - [Qualifying For This List](#qualifying-for-this-list)
  - [What Does Not Qualify](#what-does-not-qualify)
- [<a href="LIST.md">The List</a>](#the-list)
- [Contribute](#contribute)
- [Links](#links)
- [Resources](#resources)
- [Badges](#badges)
<!-- /toc -->

## Introduction

This is a list of awesome application which qualify as being declaratively configured. To understand what qualifies for this list, it is important to understand what declarative actually means. Declarative programming [as defined in wikipedia](https://en.wikipedia.org/wiki/Declarative_programming) is; 

> "a style of building the structure and elements of computer programs—that expresses the logic of a computation without describing its control flow."

An operator can declare what they want and the app makes it a reality by handling all the gritty details. Truly declarative languages that must figure out several interdependencies in the correct order in a repeatable manner will often employ graph theory such as [direct acycle graphs(DAGS)](https://en.wikipedia.org/wiki/Directed_acyclic_graph) to achieve their desired results. For example, a common declarative infrastructure tool known as terraform will use such algorithms along with a separate 'state' to speed up future runs and track the current known state after the declarative manifest has processed. In theory, this allows not only to deploy repeatable infrastructure for IT projects, but also can be used to control configuration drift by making the deployment itself idempotent.

At a high level, a declaratively structured workflow looks pretty simple. 

[![](https://mermaid.ink/img/eyJjb2RlIjoiZ3JhcGggTFJcbiAgICBNYW5pZmVzdFtEZWNsYXJhdGl2ZSBNYW5pZmVzdF1cbiAgICBFbmdpbmVbW0RlY2xhcmF0aXZlIEVuZ2luZV1dXG4gICAgU3RhdGVbRGVzaXJlZCBTdGF0ZV1cbiAgICBNYW5pZmVzdC0tPnxQcm9jZXNzZWQgdmlhfEVuZ2luZVxuICAgIEVuZ2luZS0tPnxQcm9kdWNlc3xTdGF0ZVxuIiwibWVybWFpZCI6eyJ0aGVtZSI6ImRlZmF1bHQifSwidXBkYXRlRWRpdG9yIjpmYWxzZX0)](https://mermaid-js.github.io/mermaid-live-editor/#/edit/eyJjb2RlIjoiZ3JhcGggTFJcbiAgICBNYW5pZmVzdFtEZWNsYXJhdGl2ZSBNYW5pZmVzdF1cbiAgICBFbmdpbmVbW0RlY2xhcmF0aXZlIEVuZ2luZV1dXG4gICAgU3RhdGVbRGVzaXJlZCBTdGF0ZV1cbiAgICBNYW5pZmVzdC0tPnxQcm9jZXNzZWQgdmlhfEVuZ2luZVxuICAgIEVuZ2luZS0tPnxQcm9kdWNlc3xTdGF0ZVxuIiwibWVybWFpZCI6eyJ0aGVtZSI6ImRlZmF1bHQifSwidXBkYXRlRWRpdG9yIjpmYWxzZX0)

The declarative engine is an abstraction layer that produces a desired end state from an input manifest written in a Domain Specific Language (DSL). This is a simple but powerful approach to application configuration and deployment workflows.

# Understanding Declarative Configuration

The next few sections will provide foundational knowledge of declarative configuration.

## Benefits

Several benefits emerge when using declarative engines to accomplish configuration tasks. Declarative configuration is;

1. Human readable
2. Typically succinct
3. Reusable
4. Idempotent
5. Naturally resistent to configuration skew/drift
6. Easy to check into version control
7. Is often naturally self-documenting

## Drawbacks

There are drawbacks to this model as well. A few of these in no particular order.

1. State management can be trickier to maneuver in some cases 
2. Upgrade of the underlying DSL schema can be a labyrinthine effort
3. Version 'pinning' of configuration code becomes far more important
4. Exclusivity of declarative configuration is almost required to reap the aforementioned benefits

These drawbacks typically emerge in more complex declarative configurations.

## Declarative Categories

Three broad categories of software will be considered for this list. The difference between them is a bit fuzzy but largely comes down to the target of the declarative manifests it consumes. Categories are as follows:

1. **Engines** - Engines consume declarative manifests in some manner to simplify the attainment of desired state of a broad range of systems outside of the application itself. A prime example of a declarative engine would be Terraform.

2. **Applications** - An application which is able to be configured declaratively or uses declarative manifests to accomplish application specific tasks. One example of a declarative application would be a Kubernetes operator.

3. **Platforms** - A platform which consumes declarative manifests to configure or deploy platform specific elements. A great example of a declarative platform would be Kubernetes.

## Qualifying For This List

The crux of a declarative configuration file is the manifest used to actually declare things. The input for a declarative application, platform, or engine will be one or more declarative manifests that meed the following criteria;

* Are human readable
* Follow a concrete configuration schema or language definition
* Ideally produces idempotent results when processed 
* Present a reduction of overall complexity to the operator

We do not include dependency graphing or other more complex mechanisms as a requirement as it is perfectly plausible to meet the above criteria without advanced pathing/convergence techniques. The manifest format is not relevant either. They need only be human readable so that one can look at a manifest and understand what the end state will be if processed. This means toml, hcl, json, ini, cuelang, and (the ever loved/hated) yaml are perfectly valid declarative configuration formats on [this list](LIST.md).

## What Does Not Qualify

Some applications that have broad industry support can be used as a means to enable declarative declaration for any number of other applications. For example, a great deal of effort has gone into modernizing applications to run on Kubernetes via helm. These helm packages come in the form of versioned 'charts' that can then be used by operators to express, in a declarative manner, a deployment of that application to the Kubernetes platform. These charts can mask an underlying application that is not declaratively configured very nicely in the hands of a skilled chart author. These charts are the source manifest for a declarative tool though, As such, individual helm charts are not going to be considered for this list. Rather, helm itself would be on this list as an application.

# [The List](LIST.md)

The list can be viewed [here](LIST.md) or the entire document can be viewed in its published form [here](https://)

# Contribute

Contributions welcome! Read the [contribution guidelines](CONTRIBUTING.md) first.

# Links

- [Mermaid.js online editor](https://mermaid-js.github.io/mermaid-live-editor)

# Resources

- [Declarative configuration management](https://blog.nelhage.com/post/declarative-configuration-management/)
- [Declarative Programming Opinion Article](https://www.toptal.com/software/declarative-programming)

# Badges

awesome-declarative-tools [![Awesome](https://awesome.re/badge.svg)](https://awesome.re)
