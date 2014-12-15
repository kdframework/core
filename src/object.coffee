module.exports = class KDObject

  ###*
   * @constructor KDObject
   *
   * @param {Object}    options - Object options.
   * @param {*=}        options.id - Unique identifier for object.
   * @param {KDObject=} options.delegate - Back reference to a `delegate` object.
   * @param {Object=} data
  ###
  constructor: (options = {}, data) ->

    @options = options
    @data    = data

    { @id, @delegate } = options


  ###*
   * Sets `delegate` object.
   *
   * @param {KDObject} delegate
   * @return {KDObject} delegate
  ###
  setDelegate: (delegate) -> @delegate = delegate


  ###*
   * Returns `delegate` object.
   *
   * @return {KDObject} delegate
  ###
  getDelegate: -> @delegate


  ###*
   * Sets `data` object.
   *
   * @param {*} data
   * @return {*} data
  ###
  setData: (data) -> @data = data


  ###*
   * Returns `data` object.
   *
   * @return {Object} data
  ###
  getData: -> @data


  ###*
   * Returns `options` object.
   *
   * @return {Object} options
   * @see {@link KDObject} for options object signature.
  ###
  getOptions: -> @options


  ###*
   * Sets `options` object.
   *
   * @param {Object} options
   * @see {@link KDObject} for options object signature.
  ###
  setOptions: (options = {}) ->

    { @id } = @options = options

    @setDelegate options.delegate


  ###*
   * Sets a single option on `options` object.
   *
   * @param {String} option - Object key
   * @param {*} value - Object value
  ###
  setOption: (option, value) -> @options[option] = value


  ###*
   * Returns a single option.
   *
   * @param {String} option - Object key
   * @return {*} value - Object value
  ###
  getOption: (option) -> @options[option]


  ###*
   * Defines properties on instance. `Object.defineProperty`
   * wrapper to improve the ease of usage.
   *
   * h3 Example
   *
   *     object = new KDObject
   *     object.define 'foo', -> 'bar'
   *     object.define 'qux', { get: -> 'hello world' }
   *
   *     console.log object.foo # => 'bar'
   *     console.log object.qux # => 'hello world'
   *
   * @param {String} property - key to be defined.
   * @param {Object|Function} options - options to be passed to `Object.defineProperty`
   * @see `Object.defineProperty` for detailed description.
  ###
  define: (property, options) ->

    options = { get: options }  if 'function' is typeof options

    Object.defineProperty this, property, options


