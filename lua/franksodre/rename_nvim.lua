local M = {}

-- Função para obter a palavra sob o cursor considerando separadores personalizados
local function get_word(separators)
  local word_pattern = "[%w" .. separators .. "]+"
  local word = vim.fn.expand("<cword>")
  return word:match(word_pattern)
end

-- Renomear apenas a ocorrência atual da palavra
function M.rename_word()
  local separators = "_-." -- Defina os separadores desejados
  local current_word = get_word(separators)

  if not current_word then
    print("Nenhuma palavra encontrada!")
    return
  end

  -- Pergunta o novo nome para a palavra
  local new_word = vim.fn.input("Renomear '" .. current_word .. "' para: ")

  if new_word and new_word ~= "" then
    -- Substituir apenas a ocorrência atual
    vim.cmd("normal ciw" .. new_word)
  end
end

-- Criar um comando para chamar a função
vim.api.nvim_create_user_command("RenameWord", M.rename_word, {})

return M
