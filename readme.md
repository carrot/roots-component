# Roots Component

[![npm](https://badge.fury.io/js/roots-component.png)](http://badge.fury.io/js/roots-component) [![tests](https://travis-ci.org/carrot/roots-component.png?branch=master)](https://travis-ci.org/carrot/roots-component) [![dependencies](https://david-dm.org/carrot/roots-component.png?theme=shields.io)](https://david-dm.org/carrot/roots-component)

[Component](https://github.com/component/component) functionality for [roots](http://roots.cx)

> **Note:** This project is in early development, and versioning is a little different. [Read this](http://markup.im/#q4_cRZ1Q) for more details.

## Installation
- make sure you are in your roots project directory
- `npm install roots-component --save`
- modify your `app.coffee` file to include the extension:

  ```coffee
  rootsComponent = require('roots-component')

  module.exports =
    extensions: [rootsComponent]
  ```

## Usage
Don't install components with the `component install` command - just write the name & version of the component in the `component.json` and they will be installed automatically. If you install them with `component install` then they will be installed into the wrong path and the the plugin will just install it again at the right path.

## License & Contributing
- Details on the license [can be found here](LICENSE.md)
- Details on running tests and contributing [can be found here](contributing.md)
