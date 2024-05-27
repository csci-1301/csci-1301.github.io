import { QuartzComponent, QuartzComponentConstructor, QuartzComponentProps } from "./types"
import style from "./styles/footer.scss"
import { version } from "../../package.json"
import { i18n } from "../i18n"

interface Options {
  links: Record<string, string>
}

export default ((opts?: Options) => {
  const Footer: QuartzComponent = ({ displayClass, cfg, fileData }: QuartzComponentProps) => {
    const year = new Date().getFullYear()
    const links = opts?.links ?? []
    return (
      <footer class={`${displayClass ?? ""}`}>
      { 
        // We embed the plug-in to provide feedback through github:
      }
      <h2 id="how-is-this-page">Any Comment?</h2>
      <script data-external="1"
        src="https://utteranc.es/client.js"
        repo="csci-1301/feedback-spring-2024"
        issue-term="pathname"
        label="comment"
        theme="github-light"
        crossorigin="anonymous"
        async>
      </script>
      {
        // Links About, Source Code, etc.
      }
        <hr />
        <ul>
          {Object.entries(links).map(([text, link]) => (
            <li>
              <a href={link}>{text}</a>
            </li>
          ))}
        </ul>
        <p>
        {i18n(cfg.locale).components.footer.createdWith}{" "}
        <a href="/docs/about/credits#tools" title="A list of tools used to create this resource.">free software</a> 🅭 🅯 {year}
        </p>
      </footer>
    )
  }

  Footer.css = style
  return Footer
}) satisfies QuartzComponentConstructor
