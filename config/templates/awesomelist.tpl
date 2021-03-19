entryTypes: [ "engine", "platform", "application" ]
rendered: for entryType in entryTypes
    // Create a header for this type
    //content: "## Type - \(entryType)"
    // // Loop through all entries of this type
    // for e in data.spec.entries if e.type == entryType {
    //     // define our entry
    //     """
    //     **Category** - \(e.category)
    //     **[\(e.name)](\(e.url))** - \(e.description)
    //     """
    //     // If this entry has examples include them in the ouput
    //     if len(e.examples) > 0 {
    //             """
    //         <details><summary>Examples</summary>
    //         <p>
    //         """
    //         for example in e.examples {
    //             """
    //             #### \(example.name)

    //             \(example.result)

    //             ```
    //             \(example.manifest)
    //             ```
    //             """
    //         }
    //         """
    //         </p>
    //         </details>
    //         """
    //     }
    // }
