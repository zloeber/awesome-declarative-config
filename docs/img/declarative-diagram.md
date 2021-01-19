```mermaid
graph LR
    Manifest[Declarative Manifest (DSL)]
    Engine[[Declarative Engine]]
    State[Desired State]
    Manifest-->|Processed via|Engine
    Engine-->|Produces|State
```