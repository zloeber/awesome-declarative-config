_#mylist: [ 
    { 
        animal: "Cat"
        type: "mammal"
    }, {
        animal: "Dog"
        type: "mammal"
    }, {
        animal: "Mouse"
        type: "mammal"
    }, {
        animal: "Lizard"
        type: "reptile"
    }
]

// Get all of our possibly animal types first
_#types: [ for type in _#mylist { "\(type.type)" } ]

// Example of grouping element by type
grouped: {
    for type in _#types {
        "\(type)": [for item in _#mylist if item.type == type { item.animal } ]
    }
}

// Example of grouping element by type, keep all attributes
grouped_full: {
    for type in _#types {
        "\(type)": [for item in _#mylist if item.type == type { item } ]
    }
}