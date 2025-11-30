**This repo is supposed to used as config by NvChad users!**

For the most accurate and up-to-date installation, configuration, and usage instructions, please refer to the [NvChad documentation](https://nvchad.com/).

## Code Formatting

This configuration uses **conform.nvim** with automatic formatter installation via **Mason**. Formatters for 30+ languages are supported, including Python, JavaScript, TypeScript, Java, C/C++, and more.

- **Format current file**: Press `<leader>fm` (Space + f + m by default)
- **Auto-format on save**: Enabled by default
- **See supported languages**: Check [FORMATTERS.md](FORMATTERS.md) for the complete list
- **View installed formatters**: Run `:Mason` in Neovim

All formatters are automatically installed on first startup. See [FORMATTERS.md](FORMATTERS.md) for detailed information about formatters, troubleshooting, and adding new languages.

- The main nvchad repo (NvChad/NvChad) is used as a plugin by this repo.
- So you just import its modules , like `require "nvchad.options" , require "nvchad.mappings"`
- So you can delete the .git from this repo ( when you clone it locally ) or fork it :)

# Credits

1) Lazyvim starter https://github.com/LazyVim/starter as nvchad's starter was inspired by Lazyvim's . It made a lot of things easier!
