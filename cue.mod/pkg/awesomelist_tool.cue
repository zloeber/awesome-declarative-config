package awesomelist

import (
	"tool/file",
	"tool/cli",
	"encoding/yaml"
)

command: generate: {
	// Load this file
    var: input: *"../../list.yml" | string @tag(input)
	var: output: *"LIST.MD" | string @tag(output)

	task: listfile: file.Create & {
		filename: var.output
		contents: awesomelist.rendered
	}

	task: display: cli.Print & {
		text: awesomelist.rendered
	}
}