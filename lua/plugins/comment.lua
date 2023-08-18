return {
  "echasnovski/mini.comment",
  opts = {
    mappings = {
      -- Toggle comment (like `gcip` - comment inner paragraph) for both
      -- Normal and Visual modes
      comment = '<leader>cc',

      -- Toggle comment on current line
      comment_line = '<leader>cc',

      -- Define 'comment' textobject (like `dgc` - delete whole comment block)
      textobject = '',
    }
  }
}
