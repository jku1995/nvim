return 
{
 settings = {
    Lua = {
			diagnostics = {
        --tell sumneko_lua that vim is a global variable
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
		},
		},
  }
}
