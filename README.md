## KDCore

`KDCore` is the heart of `KDFramework`. It exports all of the necessary functionality for `KDFramework` is built on.

## Example

```coffee
{ KDObject } = require 'kdf-core'

user = new KDObject { id: 'user-1' }, { name: 'John Doe' }
message = new KDObject { id: 1, delegate: user }, { text: 'Hello world!' }

{ id } = object.getDelegate()

console.log id # => 'user-1'

{ text } = message.getData()
console.log text # => 'Hello world'
```

## Installation

```
npm install kdf-core
```

