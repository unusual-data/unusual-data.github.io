function CodeBlock(el)
  if #el.classes > 0 then
    local lang = el.classes[1]
    

    local title = el.attributes['title']
    
    if not title then
      title = el.attributes['filename']
    end
    
    if not title then
      title = lang:upper() .. " Kod Bloğu"
    end
    
    local hasSourceCode = false
    for _, cls in ipairs(el.classes) do
      if cls == "sourceCode" then
        hasSourceCode = true
        break
      end
    end
    
    if not hasSourceCode then
      table.insert(el.classes, "sourceCode")
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