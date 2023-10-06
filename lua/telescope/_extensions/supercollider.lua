local definitions = require 'telescope._extensions.supercollider.definitions'

-- local scnvim_loaded, scnvim = pcall(require, "scnvim")
-- assert(scnvim_loaded, "SCNvim is not loaded - please make sure to load SCNvim first")

print("YOYOYOOYO")

return require 'telescope'.register_extension {
  exports = {
    sc_definitions = definitions.scnvim_class_definitions,
  },
}
