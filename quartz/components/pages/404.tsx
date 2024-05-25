import { i18n } from "../../i18n"
import { QuartzComponent, QuartzComponentConstructor, QuartzComponentProps } from "../types"

const NotFound: QuartzComponent = ({ cfg }: QuartzComponentProps) => {
  return (
    <article class="popover-hint">
      <h1>404</h1>
      <p>{i18n(cfg.locale).pages.error.notFound}</p>
      <p>Please, <a href="https://github.com/csci-1301/csci-1301.github.io/issues/new?body=The+following+page+is+in+error+(_please,+insert+here+the+address+of+the+page+you+were+trying+to+access_).&title=Link+in+error+on+website">report the issue on github</a>.</p>
      {
        // Link generated using https://github.com/sindresorhus/new-github-issue-url
      }
    </article>
  )
}

export default (() => NotFound) satisfies QuartzComponentConstructor
