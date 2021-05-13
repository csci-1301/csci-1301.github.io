local default_code_classes = {}

function add_default_code_class(el)
  if #(el.classes) == 0 then
    el.classes = default_code_classes
    return el
  end
end

function get_default_code_class(meta)
  if meta['default-code-class'] then
    default_code_classes = {pandoc.utils.stringify(meta['default-code-class'])}
  end
end

return {{Meta = get_default_code_class},
        {Code = add_default_code_class},
        {CodeBlock = add_default_code_class}} 
