fs = require 'graceful-fs'
path = require 'path'
should = require 'should'
Roots = require 'roots'
RootsUtil = require 'roots-util'

_path = path.join(__dirname, 'fixtures')
helpers = new RootsUtil.Helpers(base: _path)

# setup, teardown, and utils
before (done) ->
  helpers.project.install_dependencies('*', done)

#after ->
#  helpers.project.remove_folders('**/public')

# tests
describe 'roots component', ->
  before (done) ->
    @public = path.join('basic', 'public')
    @expected = 'expected'
    helpers.project.compile(Roots, 'basic', -> done())

  it 'should compile main', ->
    path1 = path.join(@public, 'js/main.js')
    helpers.file.exists(path1).should.be.ok
    helpers.file.has_content(path1).should.be.ok

  it 'should compile build', ->
    path2 = path.join(@public, 'js/build.js')
    helpers.file.exists(path2).should.be.ok
    helpers.file.has_content(path2).should.be.ok

  it 'should match expected build', ->
    actual = path.join(_path, @public, 'js/build.js')
    expected = path.join(_path, @expected, 'build.js')

    fs.readFileSync(actual, encoding: 'utf8')
      .should.equal(fs.readFileSync(expected, encoding: 'utf8'))
