function CodeBlock(el)
  if #el.classes > 0 then
    local lang = el.classes[1]
    
    local title = el.attributes['title']
    if not title then title = el.attributes['filename'] end
    if not title then title = lang:upper() .. " Kod Bloğu" end
    
    if not el.classes:includes('sourceCode') then
      table.insert(el.classes, 'sourceCode')
    end

    if not el.classes:includes('number-lines') then
      table.insert(el.classes, 'number-lines')
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
  return nil
end