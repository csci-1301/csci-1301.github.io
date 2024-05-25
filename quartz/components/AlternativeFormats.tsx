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
        
        if (fileData.slug === "404") { // We don't display anything if looking at the 404 page.
            // This is probably useless, but could be extended.
            return null
        }
        else{
            return <p class={classNames(displayClass, "alternativeFormats")}>Alternative formats: <a href={linkToPdf} title="This page in pdf format">pdf</a>, <a href={linkToOdt} title="This page in odt format">odt</a>, <a href={linkToDocx} title="This page in docx format">docx</a>, <a href={linkToMd} title="This page in markdown format">md</a>.</p>
        }
    }
    AlternativeFormats.css = style
    return AlternativeFormats
}) satisfies QuartzComponentConstructor
