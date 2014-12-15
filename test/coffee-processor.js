var coffee = require('coffee-script');

module.exports = {
  process: function process(src, path) {
    if ( path.match(/\.coffee$/) ) {
      return coffee.compile(src, {bare: true});
    }
    return src;
  }
}
