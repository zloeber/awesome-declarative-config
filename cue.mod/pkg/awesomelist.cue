package awesomelist

import {
	"tool/cli",
	"encoding/yaml"
}

awesomelist: {
	data: yaml.Unmarshal(input)
	// Loop through our predefined entry types and generate each section
	rendered: for entryType in #EntryTypes {
		// Create a header for this type
		"## Type - \(entryType)"
		// Loop through all entries of this type
		for e in data.spec.entries if e.type == entryType {
			// define our entry
			"""
			**Category** - \(e.category)
			**[\(e.name)](\(e.url))** - \(e.description)
			"""
			// If this entry has examples include them in the ouput
			if len(e.examples) > 0 {
					"""
				<details><summary>Examples</summary>
				<p>
				"""
				for example in e.examples {
					"""
					#### \(example.name)

					\(example.result)

					```
					\(example.manifest)
					```
					"""
				}
				"""
				</p>
				</details>
				"""
			}
		}
	}
}