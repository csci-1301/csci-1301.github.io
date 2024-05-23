import { QuartzComponent, QuartzComponentConstructor, QuartzComponentProps } from "./types"

export default ((opts?: Options) => {   
    const Comments: QuartzComponent = ({ displayClass, cfg }: QuartzComponentProps) => {
        return (
            <footer class={`${displayClass ?? "comments"}`}>
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
            </footer>
        )
    }
    return Comments
}) satisfies QuartzComponentConstructor 
