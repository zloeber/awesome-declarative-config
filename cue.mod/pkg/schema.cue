package awesomelist

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