vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = {"*.js","*.jsx","*.mjs","*.ts","*.tsx","*.css","*.less","*.scss","*.json","*.graphql","*.vue","*.svelte","*.yaml","*.html","*.sol","*.cjs","*.prisma"},
   command = "Prettier"
})
