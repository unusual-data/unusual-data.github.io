function Pandoc(doc)
  local meta = doc.meta
  
  if meta.date and meta.author then
    local date = pandoc.utils.stringify(meta.date)
    local author = ""
    
    if type(meta.author) == 'List' then
      author = pandoc.utils.stringify(meta.author[1])
    else
      author = pandoc.utils.stringify(meta.author)
    end

    local html_block = string.format([[
      <div class="eng-signature-container">
        <span class="eng-sig-author">%s</span>
        <span class="eng-sig-divider">::</span>
        <span class="eng-sig-date">%s</span>
      </div>
    ]], author, date)
    
    table.insert(doc.blocks, pandoc.RawBlock('html', html_block))
  end
  return doc
end
