---
title: "Social Media Preview Cards"
---

A lot of social media platforms can display a rich preview for your website when sharing a link (most notably, a cover image, a title and a description). Quartz automatically handles most of this for you with reasonable defaults, but for more control, you can customize these by setting [[social images#Frontmatter Properties]].
Quartz can also dynamically generate and use new cover images for every page to be used in link previews on social media for you. To get started with this, set `generateSocialImages: true` in `quartz.config.ts`.

## Showcase

After enabling `generateSocialImages` in `quartz.config.ts`, the social media link preview for [[authoring content | Authoring Content]] looks like this:

| Light                               | Dark                               |
| ----------------------------------- | ---------------------------------- |
| ![[social-image-preview-light.png]] | ![[social-image-preview-dark.png]] |

For testing, it is recommended to use [opengraph.xyz](https://www.opengraph.xyz/) to see what the link to your page will look like on various platforms (more info under [[social images#local testing]]).

## Customization

You can customize how images will be generated in the quartz config.

For example, here's what the default configuration looks like if you set `generateSocialImages: true`:

```typescript title="quartz.config.ts"
generateSocialImages: {
  colorScheme: "lightMode", // what colors to use for generating image, same as theme colors from config, valid values are "darkMode" and "lightMode"
  width: 1200, // width to generate with (in pixels)
  height: 630, // height to generate with (in pixels)
  excludeRoot: false, // wether to exclude "/" index path to be excluded from auto generated images (false = use auto, true = use default og image)
}
```

---

### Frontmatter Properties

> [!tip] Hint
>
> Overriding social media preview properties via frontmatter still works even if `generateSocialImages` is disabled.

The following properties can be used to customize your link previews:

| Property            | Alias            | Summary                             |
| ------------------- | ---------------- | ----------------------------------- |
| `socialDescription` | `description`    | Description to be used for preview. |
| `socialImage`       | `image`, `cover` | Link to preview image.              |

The `socialImage` property should contain a link to an image relative to `quartz/static`. If you have a folder for all your images in `quartz/static/my-images`, an example for `socialImage` could be `"my-images/cover.png"`.

> [!info] Info
>
> The priority for what image will be used for the cover image looks like the following: `frontmatter property > generated image (if enabled) > default image`.
>
> The default image (`quartz/static/og-image.png`) will only be used as a fallback if nothing else is set. If `generateSocialImages` is enabled, it will be treated as the new default per page, but can be overwritten by setting the `socialImage` frontmatter property for that page.

---

### Fully customized image generation

You can fully customize how the images being generated look by passing your own component to `generateSocialImages.imageStructure`. This component takes html/css + some page metadata/config options and converts it to an image using [satori](https://github.com/vercel/satori). Vercel provides an [online playground](https://og-playground.vercel.app/) that can be used to preview how your html/css looks like as a picture. This is ideal for prototyping your custom design.

It is recommended to write your own image components in `quartz/util/og.tsx` or any other `.tsx` file, as passing them to the config won't work otherwise. An example of the default image component can be found in `og.tsx` in `defaultImage()`.

> [!tip] Hint
>
> Satori only supports a subset of all valid CSS properties. All supported properties can be found in their [documentation](https://github.com/vercel/satori#css).

Your custom image component should have the `SocialImageOptions["imageStructure"]` type, to make development easier for you. Using a component of this type, you will be passed the following variables:

```ts
imageStructure: (
  cfg: GlobalConfiguration, // global Quartz config (useful for getting theme colors and other info)
  userOpts: UserOpts, // options passed to `generateSocialImage`
  title: string, // title of current page
  description: string, // description of current page
  fonts: SatoriOptions["fonts"], // header + body font
) => JSXInternal.Element
```

Now, you can let your creativity flow and design your own image component! For reference and some cool tips, you can check how the markup for the default image looks.

> [!example] Examples
>
> Here are some examples for markup you may need to get started:
>
> - Get a theme color
>
>   `cfg.theme.colors[colorScheme].<colorName>`, where `<colorName>` corresponds to a key in `ColorScheme` (defined at the top of `quartz/util/theme.ts`)
>
> - Use the page title/description
>
>   `<p>{title}</p>`/`<p>{description}</p>`
>
> - Use a font family
>
>   Detailed in the Fonts chapter below

---

### Fonts

You will also be passed an array containing a header and a body font (where the first entry is header and the second is body). The fonts matches the ones selected in `theme.typography.header` and `theme.typography.body` from `quartz.config.ts` and will be passed in the format required by [`satori`](https://github.com/vercel/satori). To use them in CSS, use the `.name` property (e.g. `fontFamily: fonts[1].name` to use the "body" font family).

An example of a component using the header font could look like this:

```tsx title="socialImage.tsx"
export const myImage: SocialImageOptions["imageStructure"] = (...) => {
  return <p style={{ fontFamily: fonts[0].name }}>Cool Header!</p>
}
```

> [!example]- Local fonts
>
> For cases where you use a local fonts under `static` folder, make sure to set the correct `@font-face` in `custom.scss`
>
> ```scss title="custom.scss"
> @font-face {
>   font-family: "Newsreader";
>   font-style: normal;
>   font-weight: normal;
>   font-display: swap;
>   src: url("/static/Newsreader.woff2") format("woff2");
> }
> ```
>
> Then in `quartz/util/og.tsx`, you can load the satori fonts like so:
>
> ```tsx title="quartz/util/og.tsx"
> const headerFont = joinSegments("static", "Newsreader.woff2")
> const bodyFont = joinSegments("static", "Newsreader.woff2")
>
> export async function getSatoriFont(cfg: GlobalConfiguration): Promise<SatoriOptions["fonts"]> {
>   const headerWeight: FontWeight = 700
>   const bodyWeight: FontWeight = 400
>
>   const url = new URL(`https://${cfg.baseUrl ?? "example.com"}`)
>
>   const [header, body] = await Promise.all(
>     [headerFont, bodyFont].map((font) =>
>       fetch(`${url.toString()}/${font}`).then((res) => res.arrayBuffer()),
>     ),
>   )
>
>   return [
>     { name: cfg.theme.typography.header, data: header, weight: headerWeight, style: "normal" },
>     { name: cfg.theme.typography.body, data: body, weight: bodyWeight, style: "normal" },
>   ]
> }
> ```
>
> This font then can be used with your custom structure

### Local testing

To test how the full preview of your page is going to look even before deploying, you can forward the port you're serving quartz on. In VSCode, this can easily be achieved following [this guide](https://code.visualstudio.com/docs/editor/port-forwarding) (make sure to set `Visibility` to `public` if testing on external tools like [opengraph.xyz](https://www.opengraph.xyz/)).

If you have `generateSocialImages` enabled, you can check out all generated images under `public/static/social-images`.

## Technical info

Images will be generated as `.webp` files, which helps to keep images small (the average image takes ~`19kB`). They are also compressed further using [sharp](https://sharp.pixelplumbing.com/).

When using images, the appropriate [Open Graph](https://ogp.me/) and [Twitter](https://developer.twitter.com/en/docs/twitter-for-websites/cards/guides/getting-started) meta tags will be set to ensure they work and look as expected.

## Examples

Besides the template for the default image generation (found under `quartz/util/og.tsx`), you can also add your own! To do this, you can either edit the source code of that file (not recommended) or create a new one (e.g. `customSocialImage.tsx`, source shown below).

After adding that file, you can update `quartz.config.ts` to use your image generation template as follows:

```ts
// Import component at start of file
import { customImage } from "./quartz/util/customSocialImage.tsx"

// In main config
const config: QuartzConfig = {
  ...
  generateSocialImages: {
    ...
    imageStructure: customImage, // tells quartz to use your component when generating images
  },
}
```

The following example will generate images that look as follows:

| Light                                      | Dark                                      |
| ------------------------------------------ | ----------------------------------------- |
| ![[custom-social-image-preview-light.png]] | ![[custom-social-image-preview-dark.png]] |

This example (and the default template) use colors and fonts from your theme specified in the quartz config. Fonts get passed in as a prop, where `fonts[0]` will contain the header font and `fonts[1]` will contain the body font (more info in the [[#fonts]] section).

```tsx
import { SatoriOptions } from "satori/wasm"
import { GlobalConfiguration } from "../cfg"
import { SocialImageOptions, UserOpts } from "./imageHelper"
import { QuartzPluginData } from "../plugins/vfile"

export const customImage: SocialImageOptions["imageStructure"] = (
  cfg: GlobalConfiguration,
  userOpts: UserOpts,
  title: string,
  description: string,
  fonts: SatoriOptions["fonts"],
  fileData: QuartzPluginData,
) => {
  // How many characters are allowed before switching to smaller font
  const fontBreakPoint = 22
  const useSmallerFont = title.length > fontBreakPoint

  const { colorScheme } = userOpts
  return (
    <div
      style={{
        display: "flex",
        flexDirection: "row",
        justifyContent: "flex-start",
        alignItems: "center",
        height: "100%",
        width: "100%",
      }}
    >
      <div
        style={{
          display: "flex",
          alignItems: "center",
          justifyContent: "center",
          height: "100%",
          width: "100%",
          backgroundColor: cfg.theme.colors[colorScheme].light,
          flexDirection: "column",
          gap: "2.5rem",
          paddingTop: "2rem",
          paddingBottom: "2rem",
        }}
      >
        <p
          style={{
            color: cfg.theme.colors[colorScheme].dark,
            fontSize: useSmallerFont ? 70 : 82,
            marginLeft: "4rem",
            textAlign: "center",
            marginRight: "4rem",
            fontFamily: fonts[0].name,
          }}
        >
          {title}
        </p>
        <p
          style={{
            color: cfg.theme.colors[colorScheme].dark,
            fontSize: 44,
            marginLeft: "8rem",
            marginRight: "8rem",
            lineClamp: 3,
            fontFamily: fonts[1].name,
          }}
        >
          {description}
        </p>
      </div>
      <div
        style={{
          height: "100%",
          width: "2vw",
          position: "absolute",
          backgroundColor: cfg.theme.colors[colorScheme].tertiary,
          opacity: 0.85,
        }}
      />
    </div>
  )
}
```

> [!example]- Advanced example
>
> The following example includes a customized social image with a custom background and formatted date.
>
> ```typescript title="custom-og.tsx"
> export const og: SocialImageOptions["Component"] = (
>   cfg: GlobalConfiguration,
>   fileData: QuartzPluginData,
>   { colorScheme }: Options,
>   title: string,
>   description: string,
>   fonts: SatoriOptions["fonts"],
> ) => {
>   let created: string | undefined
>   let reading: string | undefined
>   if (fileData.dates) {
>     created = formatDate(getDate(cfg, fileData)!, cfg.locale)
>   }
>   const { minutes, text: _timeTaken, words: _words } = readingTime(fileData.text!)
>   reading = i18n(cfg.locale).components.contentMeta.readingTime({
>     minutes: Math.ceil(minutes),
>   })
>
>   const Li = [created, reading]
>
>   return (
>     <div
>       style={{
>         position: "relative",
>         display: "flex",
>         flexDirection: "row",
>         alignItems: "flex-start",
>         height: "100%",
>         width: "100%",
>         backgroundImage: `url("https://${cfg.baseUrl}/static/og-image.jpeg")`,
>         backgroundSize: "100% 100%",
>       }}
>     >
>       <div
>         style={{
>           position: "absolute",
>           top: 0,
>           left: 0,
>           right: 0,
>           bottom: 0,
>           background: "radial-gradient(circle at center, transparent, rgba(0, 0, 0, 0.4) 70%)",
>         }}
>       />
>       <div
>         style={{
>           display: "flex",
>           height: "100%",
>           width: "100%",
>           flexDirection: "column",
>           justifyContent: "flex-start",
>           alignItems: "flex-start",
>           gap: "1.5rem",
>           paddingTop: "4rem",
>           paddingBottom: "4rem",
>           marginLeft: "4rem",
>         }}
>       >
>         <img
>           src={`"https://${cfg.baseUrl}/static/icon.jpeg"`}
>           style={{
>             position: "relative",
>             backgroundClip: "border-box",
>             borderRadius: "6rem",
>           }}
>           width={80}
>         />
>         <div
>           style={{
>             display: "flex",
>             flexDirection: "column",
>             textAlign: "left",
>             fontFamily: fonts[0].name,
>           }}
>         >
>           <h2
>             style={{
>               color: cfg.theme.colors[colorScheme].light,
>               fontSize: "3rem",
>               fontWeight: 700,
>               marginRight: "4rem",
>               fontFamily: fonts[0].name,
>             }}
>           >
>             {title}
>           </h2>
>           <ul
>             style={{
>               color: cfg.theme.colors[colorScheme].gray,
>               gap: "1rem",
>               fontSize: "1.5rem",
>               fontFamily: fonts[1].name,
>             }}
>           >
>             {Li.map((item, index) => {
>               if (item) {
>                 return <li key={index}>{item}</li>
>               }
>             })}
>           </ul>
>         </div>
>         <p
>           style={{
>             color: cfg.theme.colors[colorScheme].light,
>             fontSize: "1.5rem",
>             overflow: "hidden",
>             marginRight: "8rem",
>             textOverflow: "ellipsis",
>             display: "-webkit-box",
>             WebkitLineClamp: 7,
>             WebkitBoxOrient: "vertical",
>             lineClamp: 7,
>             fontFamily: fonts[1].name,
>           }}
>         >
>           {description}
>         </p>
>       </div>
>     </div>
>   )
> }
> ```
