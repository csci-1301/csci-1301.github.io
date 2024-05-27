import { QuartzComponent, QuartzComponentConstructor, QuartzComponentProps } from "./types"
import style from "./styles/alternativeFormats.scss"
import { i18n } from "../i18n"
import { classNames } from "../util/lang"


export default ((opts?: Options) => {
    const AlternativeFormats: QuartzComponent = ({ displayClass, fileData }: QuartzComponentProps) => {
        const absSlug    = "/" + fileData.slug;
        const linkToPdf  = absSlug + ".pdf";
        const linkToOdt  = absSlug + ".odt";
        const linkToDocx = absSlug + ".docx";
        const linkToMd   = absSlug + ".md";
        //  {fileData.slug === "404" ? "404" : cfg.baseUrl + fileData.slug}
        const linkToSource = "https://github.com/csci-1301/csci-1301.github.io/blob/main/" + fileData.slug + ".md";
        
        if (fileData.slug === "404" || fileData.slug == "index") {
            // We don't display anything if looking at the 404 page.
            // (This is probably useless)
            // or an index page (this is useful at least for the landing page at root).
            return null
        }
        else{
            return <p class={classNames(displayClass, "alternativeFormats")}>Alternative formats: <a href={linkToPdf} title="This page in pdf format">pdf</a>, <a href={linkToOdt} title="This page in odt format">odt</a>, <a href={linkToDocx} title="This page in docx format">docx</a>, <a href={linkToMd} title="This page in markdown format">md</a>, <a href={linkToSource} title="Source code for this page">source</a>.</p>
        }
    }
    AlternativeFormats.css = style
    return AlternativeFormats
}) satisfies QuartzComponentConstructor
