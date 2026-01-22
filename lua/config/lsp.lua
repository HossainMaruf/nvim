-- Enable LSP completion capability
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Java (jdtls)
vim.lsp.config("jdtls", {
  capabilities = capabilities,
  root_dir = vim.fs.root(0, {
    "pom.xml",
    "build.gradle",
    "mvnw",
    "gradlew",
    ".git",
  }),
})

-- Enable the server
vim.lsp.enable("jdtls")

vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
vim.keymap.set("n", "gr", vim.lsp.buf.references)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
