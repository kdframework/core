jest.dontMock '../src/object.coffee'

KDObject = require '../src/object.coffee'

describe 'KDObject', ->

  it 'has defaults', ->

    object = new KDObject

    expect(object.options).toEqual {}
    expect(object.data).toBeUndefined()
    expect(object.id).toBeUndefined()
    expect(object.delegate).toBeUndefined()


  it 'overrides defaults with options', ->

    delegate = new KDObject

    options = { id: 1, delegate: delegate }
    data    = { foo: 'bar' }

    object = new KDObject options, data

    expect(object.options).toBe options
    expect(object.data).toBe data
    expect(object.id).toBe 1
    expect(object.delegate).toBe delegate


  describe 'getters and setters', ->

    {object, delegate} = {}

    beforeEach ->
      object   = new KDObject
      delegate = new KDObject

    it 'has delegate accessors', ->

      object.setDelegate delegate
      expect(object.getDelegate()).toBe delegate

    it 'has data accessors', ->

      object.setData { foo: 'bar' }
      expect(object.getData()).toEqual { foo: 'bar' }

    it 'has options accessors', ->

      object.setOptions { id: 1, delegate: delegate }

      expect(object.getOptions()).toEqual { id: 1, delegate: delegate }
      expect(object.getDelegate()).toBe delegate, 'set options sets delegate'
      expect(object.id).toBe 1, 'set options sets id'

      object.setOption 'id', 2
      expect(object.getOption 'id').toBe 2


  describe '#define', ->

    it 'is a Object.defineProperty wrapper', ->

      object = new KDObject

      object.define 'foo', -> 'bar'
      expect(object.foo).toBe 'bar'

      object.define 'qux', { get: -> 'hello world' }
      expect(object.qux).toBe 'hello world'


