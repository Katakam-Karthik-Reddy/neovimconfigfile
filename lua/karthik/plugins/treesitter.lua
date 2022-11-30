local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end
require 'nvim-treesitter.install'.compilers = { "clang", "gcc" }
treesitter.setup {
  highlight = {
    auto_install = true,
    ensure_installed = { "c","java", "html","css","javascript","json","python","regex","sql","typescript", "lua", "cpp" },
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
