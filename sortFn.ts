import { Options } from "./quartz/components/ExplorerNode"

// This function lets us sort the entries in the explorer (=the menu)
// with a custom order (that is, not alphabetically).
// cf. https://quartz.jzhao.xyz/features/explorer#advanced-customization

export const sortFn: Options["sortFn"] = (a, b) => {
  const nameOrderMap: Record<string, number> = {
    "Intro": 10,
    "Obj. Ori. Prog.": 20,
    "introduction_to_computers_and_programming": 010,
    "csharp_fundamentals.md": 020,
    "datatypes_and_variables.md": 030,
    "operators.md": 040,
    "inputs_and_outputs.md": 050,
    "more_advanced_object_concepts.md": 060,
  }
  
  let orderA = 0
  let orderB = 0
  
  if (a.file && a.file.slug) {
    orderA = nameOrderMap[a.file.slug] || 0
  } else if (a.name) {
    orderA = nameOrderMap[a.name] || 0
  }
  
  if (b.file && b.file.slug) {
    orderB = nameOrderMap[b.file.slug] || 0
  } else if (b.name) {
    orderB = nameOrderMap[b.name] || 0
  }
  
  return orderA - orderB
}
