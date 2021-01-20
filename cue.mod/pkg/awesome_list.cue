package awesome_list

// This is all just scratch work without any use or purpose as of yet...
import (
    "strings"    
    "config/schemas/complex"
)

// An input schema
// #Input: {
//     count: int
//     msg: string
// }

// An output schema
#Output: {
    val: string
}

/*
    Convert a list element to markdown output
*/
#Entry_to_Markdown: {
    // Input for the caller
    in: #Entry
    // output for the caller
    out: #Output

    // intermediate fields
    _upper: strings.ToUpper(in.msg)
    _msg: strings.Join([_upper] * in.count, " ")

    // set output
    out: val: _msg
}

entries: [...#Entry]

// Call transform
awesome_list: #Transform & { in: { msg: "ra", count: 3 } }

stack: {
    for i, app in apps {
        "\(app)": {
            name: app
            labels: #labels & {
                app: "foo"
                tier: "\(i)"
            }
        }
    }
}