local use_utils = false

local utils = nil


if use_utils then

    utils = require 'utils'

end


local default_code_classes = {}


local function get_default_code_class(meta)

  if utils then

      utils.temp('meta', meta)

  end

  if meta['default-code-class'] then

      default_code_classes =

          {pandoc.utils.stringify(meta['default-code-class'])}

  end

end


local function add_default_code_class(el)

    if utils then

        utils.temp(el)

    end

    if #(el.classes) == 0 then

        el.classes = default_code_classes

        return el

    end

end


return {{Meta=get_default_code_class},
        {Code=add_default_code_class, CodeBlock=add_default_code_class}}
