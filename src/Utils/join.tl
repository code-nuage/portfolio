return function(...: string): string
   local parts = {...}
   assert(#parts > 0,
      "Argument <...>: Must be arguments.")
   local formated_table = {table.concat(parts, "/"):gsub("//+", "/")}
   return formated_table[1] as string
end
