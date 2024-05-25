import { QuartzComponent, QuartzComponentConstructor, QuartzComponentProps } from "./types"
import style from "./styles/footer.scss"
import { version } from "../../package.json"
import { i18n } from "../i18n"

interface Options {
  links: Record<string, string>
}

export default ((opts?: Options) => {
  const Footer: QuartzComponent = ({ displayClass, cfg, fileData }: QuartzComponentProps) => {
    //  {fileData.slug === "404" ? "404" : cfg.baseUrl + fileData.slug}
    const year = new Date().getFullYear()
    const links = opts?.links ?? []
    {
      // If this is not the 404 page, we provide a link to the source code:
      //          fileData.slug === "404" ? "" : <li><a href="https://github.com/csci-1301/csci-1301.github.io/blob/main/{fileData.slug}">{fileData.slug}Source</a></li>;
    }
//    <li><a href={linkToSource}>Source</a></li>
    const linkToSource = "https://github.com/csci-1301/csci-1301.github.io/blob/main/" + fileData.slug + ".md";
    return (
      <footer class={`${displayClass ?? ""}`}>
      { 
        // We embed the plug-in to provide feedback through github:
      }
      <h2 id="other-formats">Other Formats</h2>
      <ul><li><a href={linkToSource} title="Markdown">md</a></li></ul>
      <h2 id="how-is-this-page">How Is This Page?</h2>
      <p>Did you notice mistakes, get stuck somewhere or did you run into other issues? Was there something you really enjoyed? Enter comments below, using your github account.</p>
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
        <a href="/docs/about.html#tools" title="A list of tools used to create this resource.">free software</a> 🅭 🅯 {year}
        </p>
      </footer>
    )
  }

  Footer.css = style
  return Footer
}) satisfies QuartzComponentConstructor
