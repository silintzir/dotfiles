return {
  'dmmulroy/tsc.nvim',
  event = 'VeryLazy',
  opts = {
    flags = '-p ./tsconfig.vite.json --noEmit',
  },
}
