fs = require 'graceful-fs'
path = require 'path'
build = require 'component-builder'
resolveComponents = require 'component-resolver'
W = require 'when'

class RootsComponent
  constructor: (@roots) ->
    @projectRoot = @roots.root

  project_hooks: ->
    after: =>
      W.promise((resolve, reject) =>
        resolveComponents(
          @projectRoot
          out: path.join(@projectRoot, 'components')
          install: true
          (err, tree) =>
            if err then reject(err)
            build
              .scripts(tree)
              .use('scripts', build.plugins.js())
              .end((err, str) =>
                if err then reject(err)
                fs.writeFileSync(
                  path.join(@projectRoot, @roots.config.output, 'js/build.js')
                  build.scripts.require + str
                )
                resolve()
              )
        )
      )

module.exports = RootsComponent
