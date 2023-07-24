-- 自动安装packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- 保存此文件自动更新安装软件
-- 注意PackerCompile改成了PackerSync
-- plugins.lua改成了plugins-setup.lua，适应本地文件名字
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local mirror = "https://ghproxy.com/https://github.com/"

return require('packer').startup(function(use)
--   use 'wbthomason/packer.nvim'
  use { mirror .. 'wbthomason/packer.nvim'}
 -- use { mirror ..  'folke/tokyonight.nvim' }-- 主题
  use { 'folke/tokyonight.nvim' }
  use {
  mirror ..  'nvim-lualine/lualine.nvim',  -- 状态栏
    requires = {mirror ..  'kyazdani42/nvim-web-devicons', opt = true }  -- 状态栏图标
  }
  use {
    mirror ..  'nvim-tree/nvim-tree.lua',  -- 文档树
    requires = {
    mirror ..  'nvim-tree/nvim-web-devicons', -- 文档树图标
    }
  }
  use { mirror .. "christoomey/vim-tmux-navigator" }-- 用ctl-hjkl来定位窗口
  use {mirror ..  "nvim-treesitter/nvim-treesitter"} -- 语法高亮
  use {mirror .. "p00f/nvim-ts-rainbow"}-- 配合treesitter，不同括号颜色区分
  use {
  mirror ..   "williamboman/mason.nvim",
  mirror ..  "williamboman/mason-lspconfig.nvim",  -- 这个相当于mason.nvim和lspconfig的桥梁
  mirror ..  "neovim/nvim-lspconfig"
  }
    -- 自动补全
  use {mirror .. "hrsh7th/nvim-cmp"}
  use {mirror .. "hrsh7th/cmp-nvim-lsp"}
  use {mirror .. "L3MON4D3/LuaSnip"} -- snippets引擎，不装这个自动补全会出问题
  use {mirror .. "saadparwaiz1/cmp_luasnip"}
  use {mirror .. "rafamadriz/friendly-snippets"}
  use {mirror .. "hrsh7th/cmp-path"} -- 文件路径

  use {mirror .. "numToStr/Comment.nvim"} -- gcc和gc注释
  use {mirror .. "windwp/nvim-autopairs"} -- 自动补全括号

  use {mirror .. "akinsho/bufferline.nvim"} -- buffer分割线
  use {mirror .. "lewis6991/gitsigns.nvim"} -- 左则git提示

  use {
    mirror .. 'nvim-telescope/telescope.nvim', tag = '0.1.1',  -- 文件检索
    requires = { {mirror ..  'nvim-lua/plenary.nvim'} }
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)

