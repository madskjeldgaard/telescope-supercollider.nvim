local definitions = require 'telescope._extensions.supercollider.definitions'


return require 'telescope'.register_extension {
  exports = {
    sc_definitions = definitions.scnvim_class_definitions,
  },
}
