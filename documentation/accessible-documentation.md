---
title: "Accessible Documentation"
---

## Covered in this guide

- What accessible documentation means
- What work documentation authors have control over and responsibility for
- Recommendations for accessible documentation structure, text, images, and videos
- What areas documentation authors can advocate for or select for accessibility in others' work
- A checklist for quick documentation accessibility review
- External resources related to these topics

## Sources

This guide was written based on 

- The [Web Content Accessibility Guidelines (WCAG)](https://www.w3.org/TR/WCAG22/) principles
-  [Accessibility user research with Space Telescope Science Institute](https://github.com/Iota-School/notebooks-for-all/tree/main/user-tests#test-1-navigation) and [Project Jupyter](https://github.com/jupyter/surveys/tree/master/surveys/2023-05-jupyterlab-accessibility#readme)
-  Documentation workshops in the Scientific Python project ecosystem
-  Experience doing accessibility work on open source projects. 

It was written by Isabela Presedo-Floyd at Quansight Labs.

## What is accessible documentation?

If you've made it to this guide in the first place, [accessibility](https://en.wikipedia.org/wiki/Web_accessibility) may be familiar to you already. Ultimately, the goal is to build an equitable world for disabled and able people; for documentation, this starts by making sure that disabled people can benefit from your documentation the same ways that abled people can whether they are blind or visually impaired, have limited mobility, are deaf or hard of hearing, or have mental disabilities. 

This is a wide net to cast. Not only is there a breadth of experience and acommodations needed for all disabilities, the things that help one disabled person are often the exact things that would be impossible to use for another. So how in the world is accessible documentation even possible?

When in doubt:
- **Write it out.** Text is one of the most flexible and adaptable methods of communication digitally. It can be read visually, audibly, haptically, and be translated to other forms with the right technology. (Note, this does not apply to images of text.)
- **Provide multiple options.** Instead of having *only* text or *only* images to explain a concept, have both. This allows people to engage as they need, it provides multiple paths instead of a single path that can become a wall depending on someone's ability.
- **Use things as they are intended.** For example, if you are writing documentation in plain HTML, use HTML elements as they are intended (often called [semantic HTML](https://developer.mozilla.org/en-US/curriculum/core/semantic-html/)); use `<button>` for buttons, not links (`<a>`). This means that the accessibility support built into the structure you are working with can be leveraged, and there is much more accessibility support for many major structures than you may expect.
- **Listen to feedback.** Each person can only know so much and the people using your documentation can provide great insight. Listening to feedback is not the same as immediately making changes as soon as they are requested, do examine the impact of options as best you can.

## Know your strengths

As a documentation author, it's important to understand what is in your control and how you can make the most of it. This guide addresses only what is in control of documentation authors.

|Authors make|Authors don't make|
|---|---|
| ✅ Documentation text | ❌ Website theme|
| ✅ Images | ❌ The software being documented | 
| ✅ Videos | ❌ Website dependencies | 
| ✅ Demos of other kinds | ❌ The software used to access documentation|
| ✅ Resource files for downloading | ❌ External links|
| ✅ Community support events | |

Note: Lots of people who write documentation do a lot of other things for the project as well. Because this guide cannot cover all possible accessibility efforts related to documentation at once, it only covers tasks related to this definition of documentation author.

The things authors can control are the things it is important to take responsibility for. The things authors cannot control are worthy targets for advocating that those who can change them make those changes with accessibility considerations.

## Recommendations by type

### Documentation structure

Orienting oneself in the documentation is key to getting questions answered, discovering what options are available, or just plain knowing where to go next. Without intentional structure, any task on a documentation site gains extra obstacles.

The most important parts of documentation structure are to be consistent and to use the structural elements you have available to you as intended. Even if there are other issues, users have the best luck finding workarounds with consistent structure and predictable page elements.

Some more specific ways to do this are

- [Use headings in order](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/Heading_Elements), without skipping levels. 
- Have descriptive, consistent titles for web pages.
- Make sure page titles and their name in the navigation match.
- Provide a table of contents or a summary of what someone can find on that page. Bonus points if they are links that allow you to jump to other headings on the page.
- Use paragraphs, lists, and other or organization where appropriate. A wall of unbroken text does not work better.
- Provide a [site map](https://en.wikipedia.org/wiki/Site_map), or a list of all pages on the documentation. This is usually available in or via the website footer.
- Provide a search built in to the documentation. This is often available in the documentation site theme.

### Text

Writing accessible documentation text includes all the usual text writing considerations. Begin by following your project's style guide and update it to include the following as needed.

- Use proper grammar and punctuation for the language you are writing in. Write in complete sentences. It seems simple, but it makes a difference even from an accessibility perspective.
- Use [plain language](https://guides.18f.gov/content-guide/our-approach/plain-language/). Plain language is less formal, direct writing that focuses on using words familiar to the audience where field-specific terms are not required.
- Avoid using [jargon](https://en.wikipedia.org/wiki/Jargon). Many fields will have specific terms and these should be used and defined, but do not use jargon where a more common term will be more clear.
- Where possible, include or link to a glossary of terms relevant in the documentation.
- Use the full version of acronyms the first time they are listed so that readers have at least once reference point for the context of acronyms elsewhere in the documentation. Linking acronyms to their definitions may also be helpful. 
- Write [descriptive link text](https://www.w3.org/WAI/WCAG22/Understanding/link-purpose-in-context.html). This means that someone should be able to tell where a link will take them before they click on the link text. For example, "[visit Scientific Python](https://scientific-python.org/)" makes it clearer where the link points to than "click here."


### Images

Contrary to text, images can be some of the least flexible types of media for people to interact with. At the same time, for people who can view them, images can be some of the most useful tools in explaining information, providing examples, and offering a quick reference.

There are two groups of accessibility considerations relevant to making images: considerations within the image and considerations surrounding the image.

Within the image, or the choices one faces when designing and making the image, authors have to consider the many different ways someone can see. Consider the following:

- All images need to communicate clearly even in black and white. They can be color images, but they need to be readable and understandable if color is stripped away.
- Be cautious of red and green color combinations in an image, especially if they overlap. [Red-green color blindness is the most common type](https://en.wikipedia.org/wiki/Color_blindness) and it often makes the two colors look the same.
- Be cautious of using colors that all have the same [value](https://rmit.pressbooks.pub/colourtheory1/chapter/the-properties-of-colour/), or amount of light or dark. When color is hard to distinguish or not available, colors of the same value will look the same.
- Make sure details like text or annotations are large enough in context. There is not a single right answer on what large enough means, but keeping them no smaller than the smallest text on your documentation page when rendered is a good place to start.
- Follow [minimum contrast ratios for colors](https://www.w3.org/WAI/WCAG22/Understanding/contrast-minimum.html) on an image that overlap. The most important is to make sure that text color has at least 4.5:1 contrast on its background color. Other situations have other [contrast ratios that can be calculated online](https://webaim.org/resources/contrastchecker/).
- Make sure the image can be expanded, zoomed, or otherwise respond to user size adjustments. This may cross into limitations with the documentation theme, but it is worth reviewing for and making a note if it is not within author control.
- [Do not use flashing animations](https://www.w3.org/WAI/WCAG22/Understanding/three-flashes.html) for any animated images. Flashing refers to any fast, high contrast color and/or light changes more than three times per second. These are known to trigger seizures and other pain.
- Be consistent with your visuals, iconography, and colors where relevant. This preserves continuity and can help users orient themselves within the documentation.
- Consider if some information-dense images can be broken into multiple images. 

Surrounding the image, or the choices one faces once the images appears in context, authors have to consider what happens if the image is not available.

- Any text in the image needs to be available as actual text outside the image. No text should be lost because an image cannot be read.
- Images need an image description (also called [alt text](https://developer.mozilla.org/en-US/docs/Web/API/HTMLImageElement/alt) or text alternatives). Generally, this is intended to capture the information the image provides in non-image form. Depending on the type of image and its role in documentation, there may be a few ways to do this. Refer to this [image description decision tree](https://www.w3.org/WAI/tutorials/images/decision-tree/)).
- For images with data involved, link out to the source data or a tutorial notebook when possible.
- Captions are not image descriptions. Do not use one in place of the other.

In general do not use images to replace text information, use them to augment it.

### Videos

Introduce videos and their relevance to the surrounding documentation directly before they appear. 

Videos in documentation should not autoplay. They need a play button and a pause/stop button.

Videos with sound benefit from volume controls. Since this may be managed by the user outside the website, it is less critical.

Ideally, all videos with voices have closed captioning (text overlaid on the video player in time with speaking) and a transcript (text in paragraphs not timed to the video) linked. If this information is already in paragraphs surrounding the video, these may not be needed.

Videos cannot have [flashing lights/colors at more than three times per second](https://www.w3.org/WAI/WCAG22/Understanding/three-flashes.html). This risks triggering seizures. Do not allow this in your documentation.

Videos are a good addition to documentation that can be very helpful for anyone wanting to see the software in action, but they are best used as additional documentation features. A good way to test that you've covered the same information elsewhere in the documentation is to break the link to the video and ensure that no information is missing.

## For things documentation authors don't make

While it is important to recognize what accessibility considerations are directly in the hands of those writing documentation, that doesn't mean that a documentation author's power has to end there. Even without taking on other documentation team roles, authors can impact choices and give feedback on the projects they work on.

**Select for accessibility.** Whether making documentation from scratch or writing for existing documentation, choices will always have to be made. Authors can select options to those choices that have accessibility in mind. Examples include

- Choosing a website theme that has accessibility information included or has traits that fit WCAG or other standards.
- Deciding to not accept new images to the documentation if they don't have text descriptions.
- Removing the need for dependencies that don't have accessibility considerations from within the documentation, such as removing videos until you can link to a video player that does not autoplay.

**Advocate for change.** In many cases, accessiblity-related changes cannot be made by one person or require multiple people's expertise. These situations benefit from advocacy, where an author can use the accessibility awareness they have to encourage others to make changes with them. Examples include

- Noting accessibility issues you find in your own documentation by describing its current behavior compared with the desired behavior. 
- Asking specific questions about accessibility support to members of your team or to dependencies' teams. Noting the desired accessible behavior is also helpful here.
- Gathering with other people in your project or across others who want to prioritize accessibility efforts. Figure out what issues you can face together or what you want to advocate for as a team.

**Edit what you have.** Sometimes authors do have the option to make a direct change to an aspect of the documentation outside of its contents. When these changes are possible, they are often worth pursuing as long as the whole team is on board, though keeping in mind necessary maintenance must be done. Examples include

- Updating the existing documentation to include descriptive links or make page titles match their navigation names.
- Add specific accessibility considerations you feel comfortable reviewing for as a required part of the review process in accepting additions to the documentation. This could be declining to merge any documentation without in-order heading levels or that change the color of the theme to be low contrast.
- Make changes to documentation dependencies like theme and contribute them upstream so the original project and all those using it can benefit.

## Checklist

- [ ] Each page has a descriptive title.
- [ ] Each page's title matches how it appears in the navigation.
- [ ] Pages have a table of contents and/or summary of contents.
- [ ] Each page has been added to the documentation site map.
- [ ] Text uses headings in order, without skipping levels.
- [ ] Text uses paragraph breaks, lists, and other or organization where appropriate.
- [ ] Text uses proper grammar and punctuation.
- [ ] Text uses field-specific terms only when needed.
- [ ] Text includes or links to the full name of acronyms at least the first time they are used.
- [ ] Link text describes (contextually) where the link will take users if selected.
- [ ] Images can be understood even when viewed in grayscale.
- [ ] Images have sufficient color contrast.
- [ ] Images can be expanded, zoomed, or otherwise respond to user size adjustments. 
- [ ] Details on images (like annotations) appear similar size to body text in context.
- [ ] Images and details within images are used consistently across the page.
- [ ] Images and details within images are used consistently across all documentation (where appropriate).
- [ ] Animated images and/or videos flash less than three times per second.
- [ ] Videos are briefly introduced in text preceding the video.
- [ ] Videos do not autoplay.
- [ ] Videos have volume control or do not override system volume controls.
- [ ] Videos have closed captioning available.
- [ ] Videos have text transcripts available.
- [ ] Sections of code, iframes, or any other self-contained content are briefly introduced in the text preceding them.
- [ ] If all content on the page other than text cannot be loaded, the information that page exists to share can still be accessed. 

## Further resources

- [Web Accessibility Initiative](https://www.w3.org/WAI/)
- [Write The Docs software documentation guide](https://www.writethedocs.org/guide/)
- [Google developer documentation style guide](https://developers.google.com/style/)
- [Web Accessibility Initiative alt decision tree](https://www.w3.org/WAI/tutorials/images/decision-tree/) (for images)
- [DIAGRAM Center image description Guidelines](http://diagramcenter.org/table-of-contents-2.html)
- [Alt text writing workshops](https://github.com/isabela-pf/a11y-events/tree/main/workshop-resources/alt-text#alt-textimage-description-workshops)
- [Writing Documentation with Neurodivergent Open Source Contributors In Mind video](https://www.writethedocs.org/videos/portland/2021/writing-documentation-with-neurodivergent-open-source-contributors-in-mind-rin-oliver/)
- [Section508.gov Content Creation](https://www.section508.gov/create/)
- [Write The Docs accessible docs and colorblindness newsletter archives](https://www.writethedocs.org/blog/newsletter-august-2017/#accessible-docs-colorblindness-edition)
- [A11y-Friendly Documentation video](https://www.writethedocs.org/videos/prague/2018/a11y-friendly-documentation-carolyn-stransky/)
- [Inclusive Tech Docs - TechComm Meets Accessibility video](https://www.writethedocs.org/videos/eu/2015/inclusive-tech-docs-techcomm-meets-accessibility-rmatic/)
- [Accessible Math on the Web: A Server/Client Solution video](https://www.writethedocs.org/videos/na/2016/accessible-math-on-the-web-a-server-client-solution-tim-arnold/)
- [Chartability for data visualization accessibility](https://chartability.fizz.studio/)