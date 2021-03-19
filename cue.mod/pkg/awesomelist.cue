package awesomelist

import "tool/cli"
import "encoding/yaml"

#Schema: {

    #Example: {
        name:     !=""
        manifest: !=""
        result:   !=""
    }

    #EntryTypes: "engine" | "platform" | "application"

    #Link: {
        description: !=""
        url:		     =~"https?:\\/\\/(www\\.)?[-a-zA-Z0-9@:%._\\+~#=]{1,256}\\.[a-zA-Z0-9()]{1,6}\\b([-a-zA-Z0-9()@:%_\\+.~#?&//=]*)"
    }

    #Entry: {
        name:  	     !=""
        type:  	     #EntryTypes
        category:    !=""
        url:		     =~"https?:\\/\\/(www\\.)?[-a-zA-Z0-9@:%._\\+~#=]{1,256}\\.[a-zA-Z0-9()]{1,6}\\b([-a-zA-Z0-9()@:%_\\+.~#?&//=]*)"
        description: !=""
        examples:    [...#Example]
        links:       [...#Link]
    }

    apiVersion: "v1"
    kind:       "AwesomeList"
    spec: {
        name:    !=""
        groupBy: "category" | "type"
        entries: [...#Entry]
    }
}

// awesomelist: {
//     //data: yaml.Unmarshal(input)
//     // Loop through our predefined entry types and generate each section
//     rendered: for entryType in #EntryTypes {
//         // Create a header for this type
//         content: "## Type - \(entryType)"
//         // Loop through all entries of this type
//         for e in data.spec.entries if e.type == entryType {
//             // define our entry
//             """
//             **Category** - \(e.category)
//             **[\(e.name)](\(e.url))** - \(e.description)
//             """
//             // If this entry has examples include them in the ouput
//             if len(e.examples) > 0 {
//                     """
//                 <details><summary>Examples</summary>
//                 <p>
//                 """
//                 for example in e.examples {
//                     """
//                     #### \(example.name)

//                     \(example.result)

//                     ```
//                     \(example.manifest)
//                     ```
//                     """
//                 }
//                 """
//                 </p>
//                 </details>
//                 """
//             }
//         }
//     }
// }

awesomelist: yaml.Validate(#Schema)

awesomelist: {
    data: yaml.Unmarshal(input)
    // Loop through our predefined entry types and generate each section
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

}