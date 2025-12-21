function CodeBlock(el)
  if el.classes:includes("cell-code") then return nil end

  local lang = el.classes[1]
  
  local title = el.attributes['title']
  if not title then title = el.attributes['filename'] end
  if not title and lang then title = lang:upper() .. " Kod Bloğu" end
  if not title then title = "Kod Bloğu" end 

  if not el.classes:includes("sourceCode") then
    el.classes:insert("sourceCode")
  end

  if not el.classes:includes("number-lines") then
    el.classes:insert("number-lines")
  end
  
  return quarto.Callout({
    type = "note",
    content = { el }, 
    title = title,
    collapse = true,
    icon = false,
    appearance = "simple" 
  })
end