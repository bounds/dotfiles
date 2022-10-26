local api = vim.api

api.nvim_create_autocmd("BufWritePre", { 
  pattern = {"*.js","*.jsx","*.mjs","*.ts","*.tsx","*.css","*.less","*.scss","*.json","*.graphql","*.vue","*.svelte","*.yaml","*.html","*.sol"},
  command = "Prettier"
})