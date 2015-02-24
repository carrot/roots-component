fs = require 'graceful-fs'
path = require 'path'
build = require 'component-builder'
resolve = require 'component-resolver'

module.exports = ->

  class RootsComponent
    constructor: (@roots) ->
      @projectRoot = @roots.root

    project_hooks: ->
      console.log "stepped into project_hooks"
      after: =>
        console.log "stepped into after"
        resolve(@projectRoot,
          (err, tree) ->
            console.log "stepped into resolve"
            if err then throw err

            build.scripts(tree)
              .use('scripts', build.plugins.js())
              .end((err, str) ->
                console.log "stepped into build"
                if err then throw err

                else
                  fs.writeFileSync(path.join(@projectRoot, "./public/js/build.js")
                    , build.scripts.require + str
                  )
              )
        )
