import { Options } from "./quartz/components/ExplorerNode"
import { nameOrderMap } from "./content/web-order"

// This function lets us sort the entries in the explorer (=the menu)
// with a custom order (that is, not alphabetically).
// cf. https://quartz.jzhao.xyz/features/explorer#advanced-customization

export const sortFn: Options["sortFn"] = (a, b) => {
  let orderA = 0
  let orderB = 0
  // console.log("hello from before the page loads!") // <- For debugging purposes
   
  if (a.file && a.file.slug) {
    // console.log(a.file.slug) // <- For debugging purposes
    orderA = nameOrderMap[a.file.slug] || 0
  } else if (a.name) {
//    console.log(a.name) // <- For debugging purposes
    orderA = nameOrderMap[a.name] || 0
  }
  
  if (b.file && b.file.slug) {
    orderB = nameOrderMap[b.file.slug] || 0
  } else if (b.name) {
    orderB = nameOrderMap[b.name] || 0
  }
  
  return orderA - orderB
}
