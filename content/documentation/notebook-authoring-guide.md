# Notebook Authoring Recommendations

## Introduction

This document provides recommendations for authors of Jupyter notebook files to create notebooks in a way that provides better digital support for disabled people. Recommendations here collect actions that authors can take on the notebook file even if they do not have control over the application or other platforms that may be used to host and open their notebooks; if you are writing a notebook, these recommendations are for you!

### Version Info

Published:

Last updated:

Recommendation contributors: Isabela Presedo-Floyd, Gabriel Fouasnon, Tania Allard

The following recommendations are based on user feedback and notebook authoring experience provided for the community's knowledge and support. They are not legal recommendations or formal accessibility compliance criteria.

### Sources, People, and Institutions

User research, testing, and other accessibility resources that supported this document as are follows. They are ordered from most to least notebook-specific.

- Notebooks for All: Space Telescope Science Institute (STScI), Iota School, Quansight Labs, Jupyter community
  - Jenn Kotler (STScI)
  - Patrick Smyth (Iota School)
  - Tony Fast (Jupyter Community)
  - Erik Tollerud (STScI)
  - Isabela Presedo-Floyd (Quansight Labs)
- JupyterLab user testing: Quansight Labs
  - Tania Allard
  - Gabriel Fouasnon
  - Stephannie Jiménez Gacha
  - Isabela Presedo-Floyd
- Jupyter Accessibility Workshops: Quansight Labs, Jupyter community
- Web Content Accessibility Guidelines (WCAG) 2.2: World Wide Web Consortium (W3C) Recommendation

Notebooks for All, JupyterLab user testing, Jupyter Accessibility Workshops, and these recommendations were funded by

- The Chan Zuckerberg Institute (CZI) Essential Open Souce Software for Science (EOSS) grants
- STScI Barbara A. Mikulski Archive for Space Telescopes (MAST) Director's Discretionary program (DDRF)
- Quansight Labs

### Notebook Background

[Project Jupyter](https://jupyter.org/) is an open-source project that creates and maintains many tools and standards related to interactive computing. One of their projects is the [Jupyter notebook file](https://en.wikipedia.org/wiki/Project_Jupyter#Documents), a document that combines text, code, and more side by side for authors and readers to interact with. In 2017 Project Jupyter’s work, including the notebook file, was acknowledged for its impact with the [Association for Computing Machinery’s (ACM) Software System Award](https://www.youtube.com/watch?v=qbtDVdEr8SY).

Notebooks are used across disciplines and throughout education, research, and industry. Whether for exploratory data analysis, coding tutorials, scientific research papers, data-driven journalism, or documentation, notebooks offer many advantages. But like any other digital document, how well a notebook file may work for disabled people partially depends on how that file is written.

### Accessibility Background

In this context, accessibility refers specifically to how usable and enjoyable a digital experience is to disabled people using it. This often includes how these experiences interact with assistive technology like screen readers, screen magnifiers, voice controls/speech recognitions, alternate input devices, and more. This may also include features built into the software to help disabled users like light and dark and high contrast themes, keyboard-only controls, zoom in/zoom out, and more. While technology and features like these do impact how disabled people interact with digital experiences, the most important part of accessibility work is listening to disabled people themselves. The goal is ensuring that they can access, interact with, and complete all tasks that abled people can for that digital experience. More than that, building experiences that are equivalent to and pleasant for disabled and abled people alike is necessary for equity.

Accessibility considerations belong to more than only Jupyter notebooks. These recommendations are made up of information gathered in user feedback and research related to Jupyter software as well as broader Internet standards like WCAG.

Depending on what context a notebook is written for, it may be subject to other accessibility guidelines. For example, in many educational settings, accessibility of teaching materials is a legal requirement with specific compliance criteria. Organizations may have notebook style guides that include accessibility considerations. We informally recommend using the most specialized recommendations you have available to provide the support most relevant to the context you are writing the notebook in.

While the notebook file may be opened and edited in a number of applications with varying accessibility support, these recommendations are designed to support notebook authors only where they have control: in the notebook file itself. All notebook authors can take immediate action and improve accessibility support in their notebooks now with this approach.

### How To Use These Guidelines

The guidelines are organized by common content types in the notebook. Unless the notebook has every type of content listed below, there is no need to read the guidelines end to end. The authors recommend reviewing what the contents of a given notebook are and navigating to each guidelines section to adjust the notebook accordingly.

If you do not find guidelines for a type of content you have in your notebook, referring to the next closest type of content or other digital accessibility resources is often the next step.

Using linked WCAG or similar guidelines may help deepen your understanding of what you can do to author a more accessible notebook, but since they are written with the whole World Wide Web in mind and not only notebooks, they can come across as abstract. Reading them with this expectation may help you feel less overwhelmed by the sheer scope they are made to cover.

## Guidelines

### The first cell

- The first cell holds the first piece of information someone will encounter after the file information (i.e. file name, file extension).
  - **Why it matters:** It’s useful to provide context here so people can understand what’s in the notebook and if it’s what they are searching for, especially if they are going to have to spend time figuring out how to get their assistive tech compatible with it,
- Based on feedback, there are a few specific elements recommended to put in the first cell
  - Title (as an H1 or `#` in a Markdown cell)
    - **Why it matters:** Providing a title with proper title syntax sets up a navigation structure that some assistive tech relies on. Setting a title in the notebook also ensures the author has control over the most relevant notebook title since, depending on what interface a notebook is opened in, an application might generate a title based on the application name, notebook file name, or notebook content.
  - 1–2 sentence summary
    - **Why it matters:** Have you ever started reading or watching a how-to based on the title and found partway through it wasn’t what you needed? Depending on how the user navigates the notebook, diving into a notebook can be a big commitment—more than just scrolling and skimming. Providing more brief information at the top of the notebook helps users know what they have found so they can make informed choices.
  - Date authored/updated
    - **Why it matters:** Readers should be able to know what version and how recent information in a notebook is.
  - Author(s) and affiliations
    - **Why it matters:** Crediting the authors and related affiliations and/or funding is the right thing to do, and providing information to readers is what they deserve to have the full context for a notebook.
  - Link any relevant sources (like raw data, code repository, or anything else you want to offer readers to have when working in your notebook)
    - **Why it matters:** This can depend on what is linked. In many cases, transparency and reproducibility are the main purpose. Depending on how a user navigates a notebook, it may also be helpful for them to follow along with the source data. Several users commented that they can often navigate better through source data than visualizations or tables in notebooks with their assistive technology.
- You know your notebook best; if there’s other information you want people to know before getting started, put it here.
- Do keep in mind this section needs to be brief. Really consider what is necessary for users to know before continuing with the notebook and prioritize that.

### Table of contents

- Have a table of contents near the top of the notebook, probably in the first or second cell. It should be an ordered list. It should have a heading 2 (`##` in a Markdown cell) title that reads “Table of contents.”If making it manually, double check the contents match the names of the headings used accurately.
  - **Why it matters:** This was one of the most requested items in user feedback sessions. It supports people in a few ways. 1. Summarizes notebook content. 2. Supports navigation. 3. Provides a kind of homebase when users get lost.
- Depending on what application a notebook is opened in, the application may create a table of contents automatically based on the Markdown headings authors use in the notebook. It is still recommended to provide one in the notebook file itself since this is not a behavior all notebooks share.
- If possible, linking table of contents entries to the header links generated by their rendered Markdown in the notebook is helpful. In many cases, this is not possible or feasible.

### Headings

- Include Markdown headings in notebooks. That does mean there need to be Markdown cells, even if they are used primarily or exclusively for headings.
  - **Why it matters:** Headings visually and structurally provide guides throughout a web document. They break up content in a way that helps make a notebook more skimmable with vision and with assistive tech that uses tables of contents like a screen reader. They can also help users navigate quickly and effectively.
- Use Markdown headings in order from headings 1 (`#`) to 6 (`######`). Do not skip numbers, not even for styling.
  - **Why it matters:** Markdown headings create a structure for navigating a document like a ladder. Missing rungs on the ladder can lead to anything from clunky navigation to breaking it altogether. While authors do not need to use headings all the way down to heading 6, it is important to start with 1 and go in order.
- Use only one heading 1 (`#`) heading in a notebook. Based on The first cell recommendations, heading 1 will be in your first cell.
  - **Why it matters:** Heading 1 often determines the title of a document, article, or similar grouping. Using multiple heading 1s may miscommunicate that there are multiple notebooks or otherwise upset the HTML structure that many assistive technologies rely on.

### Text

- Use plain language wherever possible. Using field or audience specific terminology as needed is good, but do make a point to avoid jargon for jargon’s sake.
  - **Why it matters:** Plain language is intended to better meet the reader where they are at. Words that are more familiar or more common may be easier to recognize or look up. This can support anyone from readers with cognitive disabilities to readers who are from outside the field the notebook is written for.
- Use proper Markdown to structure and style your text. This means use Markdown as according to specification, not just because you prefer the way it looks visually. At time of writing, notebooks do not support a singular Markdown specification.
  - **Why it matters:** Markdown syntax maps to HTML elements that have accessibility support built in. Using markdown syntax not only ensures consistency and clarity, it can provide better support for some assistive technologies.
- Have sufficient color contrast for text. Authors may not have control of how text is colored or what color background it is on and may have to accept whatever that notebook application supports. If the author does have control over text color, then it is their responsibility to make sure their notebook meets color contrast ratios relevant to the text size.
  - **Why it matters:** Sufficient color contrast helps important information stand out better, especially for low vision readers.
- Define acronyms. At minimum, write the full form of an acronym the first time it is used with the acronym in parentheses after it. For example, Be Right Back (BRB). The acronym can be used after in its abbreviated form. Authors may also want to use the HTML `<abbr>` element so that readers can access the acronym’s meaning at any point in the notebook.
  - **Why it matters:** Acronyms can often be used to reference multiple things. Acronyms alone may also not provide enough context for readers not familiar with the field. Starting with the full form ensures the reader and author start on the same metaphorical page to support more effective communication.
- Define terms relevant to the notebook’s contents. When introducing a new term, using field-specific terms, or similarly vital contents in a notebook, provide a way for readers to get more information on that term. This could be done by writing a brief definition in the notebook, linking out of the notebook to another resource on the internet, or something similar.
  - **Why it matters:** Defining terms supports communication between authors and readers by providing clear meaning where it matters most. It’s good practice, and may also support readers with cognitive disabilities.

### Code

- Choose a syntax highlighting theme with sufficient color contrast. Authors may not have control of what syntax highlighting theme is used and may have to accept whatever that notebook application supports. If the author does have control over syntax highlighting then it is their responsibility to make sure they choose one that meets contrast ratios relevant to the text size.
  - **Why it matters:** Sufficient color contrast helps important information stand out better, especially for low vision readers.
- Color should not be the only means of conveying information (ie. error messages should be distinguished not only by being red, but by having the word Error on them.)
  - **Why it matters:** If a reader cannot process color, if the reader has low vision, or if the notebook has any issues loading on the reader’s computer, color can easily become lost. If there are more opportunities for the reader to gain information than just the color chosen, then it ensures any color-related issues are not catastrophic for the notebook’s meaning.
- Summarize what is in a code block and explain what it does before it needs to be run. While some authors might forgo this for narrative reasons, do so sparingly.
  - **Why it matters:** Readers need to know what code they are running in order to make choices about security, available resources, and safety of that code to their system. They need to understand what they are doing before they do it.
- Use the right code styling for the right job. Inline Markdown code styling, code block Markdown code styling, and a notebook code cell are all different ways of representing code in a notebook and they all have different capabilities that should be consciously weighed by the author.
  - **Why it matters:** Each of these code styling options may be read differently depending on the assistive tech used. Exactly how they will be read can vary too much to be summarized, but using these options consistently will ensure they are read in the same ways and preserve the meaning of your notebook.

### Links

- Write descriptive links, meaning link text describes where the link goes to and/or what will happen if the link is activated.
  - **Why it matters:** People need to be informed of what an action will do before deciding if they want to take that action.
- Have sufficient color contrast for link text. Authors may not have control of what color us used for link text and may have to accept whatever that notebook application supports. If the author does have control then it is their responsibility to make sure they choose one that meets contrast ratios relevant to the text size.
  - **Why it matters:** Sufficient color contrast helps important information stand out better, especially for low vision readers.
- Links need a non-color indicator that they are links. Most of the time this is achieved by underlining a link. Authors may not have control over link styling, but they can choose to add their own non-styling indicators as long as they are used consistently.
  - **Why it matters:** If a reader cannot process color, if the reader has low vision, or if the notebook has any issues loading on the reader’s computer, color can easily become lost. If there are more opportunities for the reader to gain information than just the color chosen, then it ensures any color-related issues are not catastrophic for the notebook’s meaning. Additionally, standard links on the web are often underlined and that may be familiar to many people.

### Images

- All images need image descriptions. Whenever possible, descriptions should be added by writing alt text. If alt text cannot be added, describing the image directly before or after the image is the next best option. If the image is purely decorative and holds no information needed to understand the notebook, the image still needs an alt text field, but its value can be empty.
  - **Why it matters:** Whether an image fails to load or the reader cannot visually process an image, image descriptions provide support for image content in an alternative format. Text can be read aloud via screen reader, can be translated into Braille, and can be translated into a different language, too, in a way an image file cannot.
- All text found in images needs to be represented in text form somewhere else in the notebook. This may be through alt text, it may be through another description of the image text, or it may be part of the notebook narrative on its own. Make sure that the notebook would make sense and have complete information even if all the images were removed.
  - **Why it matters:** Text in an image file is not transformable; because of this, text in an image file is inaccessible to much assistive technology. In order to make sure this content is not omitted for users who cannot access an image for any reason, text needs to exist in text form.
- Images can have all kinds of content, so images need to have sufficient color contrast for the type of content they hold. For example, images with text need to have sufficient text contrast, diagrams need to have sufficient non-text contrast on diagram elements, and so on.
  - **Why it matters:** Sufficient color contrast helps important information stand out better, especially for low vision readers.
- Be mindful of color choices in images. Combining red and green in the same image or using colors that are close together (like blue and purple) side by side is not recommended.
  - **Why it matters:** Color can carry lots of meaning, but if someone is color blind, blind or low vision, or has another visual disability, they may not be able to perceive the color the way the author intends. Having sufficient contrast will be a safety net because contrast can be perceived even with color blindness or similar disabilities, but being conscientious in the first place can solve many issues.
- Make sure to convey information in a way not reliant on color. While there are many reasons why color might not be clear to the person reading a notebook, the solution is the same: repeat the information in a non-color option. For example, instead of color coding something red and green, color code with a red x and a green check mark. Instead of indicating an error only by color, give it a text label as well. If the information wouldn’t be clear if the image was in grayscale, do not use that design.
  - **Why it matters:** If a reader cannot process color, if the reader has low vision, or if the notebook has any issues loading on the reader’s computer, color can easily become lost. If there are more opportunities for the reader to gain information than just the color chosen, then it ensures any color-related issues are not catastrophic for the notebook’s meaning.
- For any images with an animated aspect, do not use flashing lights and/or colors. Flashing is counted as more than three times in any one second period, and is especially dangerous with the color red. Do not use these combinations; slow down the animation or find another way to communicate.
  - **Why it matters:** Flashing lights at this threshold are known to cause seizures, migraines, and related physical harm. The consequences are serious. Do not ignore this issue in your own or others’ work.

### Data visualizations

- Data visualizations can be made in a variety of ways. However they are made, make sure they match the principles for those building blocks. For example, a data visualization linked as a PNG needs to follow image accessibility criteria (including writing alt text). A data visualization linked in a video needs to follow video accessibility criteria. A data visualization made up of interactive widgets needs to follow accessibility criteria for the most similar interactive areas. And so on.
  - **Why it matters:** Because data visualizations are a level below the files or libraries that make them, respecting the guidelines from a level above helps ensure that accessibility support is completed in the umbrella of its parent content type. The variety in visualizations makes it difficult to catch everything accessibility-related without considering the other parts that comprise it.
- Data visualizations need to be complete (ie. have titles, label all axes with units, key if relevant). Double check that your visualizations are not missing labels, sources, or other elements that would be required by a primary school teacher grading you on completion.
  - **Why it matters:** There are two reasons. First, titles, labels, and similar parts of a visualization are necessary for it to be complete. Not adding relevant information shows a disregard for completing the visualization. Second, these parts are required because they provide context.
- Explain the relevance of the visualization and/or how it’s made before showing it. This is doubly important if creating the visualization requires the reader to run code. Think of it as an introduction for a guest lecturer; summarize why it matters, why it is relevant to your notebook, and what the reader can’t afford to miss. If you remove the visualization and feel lost reading the notebook, you know you are missing information.
- **Why it matters:** Readers deserve to know what they are running, working with, or reading before they read it. This empowers them to make the decision they want with all the relevant information. Explaining the relevance is also a good backup for if a visualization fails to load or cannot be perceived in some way.
- Use plain language wherever possible for text in your visualization. Use language and terms that match what you are using outside the visualization to preserve continuity.
  - **Why it matters:** Plain language is intended to better meet the reader where they are at. Words that are more familiar or more common may be easier to recognize or look up. This can support anyone from readers with cognitive disabilities to readers who are from outside the field the notebook is written for.
- For any visualizations with an animated aspect, do not use flashing lights and/or colors. Flashing is counted as more than three times in any one second period, and is especially dangerous with the color red. Do not use these combinations; slow down the animation or find another way to communicate.
  - **Why it matters:** Flashing lights at this threshold are known to cause seizures, migraines, and related physical harm. The consequences are serious. Do not ignore this issue in your own or others’ work.
- Have sufficient color contrast for any areas containing information (which is likely the entire visualization). Use text contrast for text, non-text contrast for other elements, and be diligent—visualizations are often information dense and you don’t want to lose anything to low contrast.
  - **Why it matters:** Sufficient color contrast helps important information stand out better, especially for low vision readers.
- Color coding can be useful for many, but it should not be the only means of coding or labeling information. Consider text labels or patterns in addition to color coding so you ensure there are multiple methods available for understanding the information.
  - **Why it matters:** If a reader cannot process color, if the reader has low vision, or if the notebook has any issues loading on the reader’s computer, color can easily become lost. If there are more opportunities for the reader to gain information than just the color chosen, then it ensures any color-related issues are not catastrophic for the notebook’s meaning.
- Make sure to convey information in a way not reliant on color. This could be a text label or pattern like the above point, but be mindful that the variety of visualizations in the world means you may need to use a method this guide is not predicting. If the information wouldn’t be clear if the visualization was in grayscale, do not use that design.
  - **Why it matters:** If a reader cannot process color, if the reader has low vision, or if the notebook has any issues loading on the reader’s computer, color can easily become lost. If there are more opportunities for the reader to gain information than just the color chosen, then it ensures any color-related issues are not catastrophic for the notebook’s meaning.
- Link sources for your data and/or analysis if available. If not available, it still needs to be cited appropriately.
  - **Why it matters:** Linking sources is a good authorial practice, responsible for scientific reproducibility, and provides readers another route for engaging with the content of your notebook. In some cases, disabled people may prefer to work with the data alongside or separate of the way the notebook does so that they can explore it on their own terms and with their own assistive technology set up.

### Interactive areas

Notebooks popularly use interactive widgets, embed external content of all kinds, and even produce interactive code outputs made directly in the cells before. This can be a wonderful experience! It can also create complex user experiences that have additional accessibility considerations. While “interactive areas” is a general term to cover many types of content, the following are commonly overlooked needs that can greatly improve the accessibility of parts of the notebook that respond directly to user interaction.

- Find the closest things or identify the parts that interactive thing is made of. Follow their collective accessibility criteria.
  - **Why it matters:** Referencing existing accessibility criteria is almost always better than making your own off the cuff. Even if you cannot find information on the specific area of your notebook, it is likely something similar in WCAG (or similar) has helpful information you can leverage to make your life and your reader’s life easier.
- Do not use flashing content, even for interaction states. Flashing is counted as more than three times in any one second period, and is especially dangerous with the color red. Do not use these combinations; slow down the animation or find another way to communicate.
  - **Why it matters:** Flashing lights at this threshold are known to cause seizures, migraines, and related physical harm. The consequences are serious. Do not ignore this issue in your own or others’ work.
- Have sufficient text color contrast wherever there is text.
  - **Why it matters:** Sufficient color contrast helps important information stand out better, especially for low vision readers.
- Have sufficient non-text (like buttons, sliders, etc.) color contrast, especially wherever user input/interactions are needed.
  - **Why it matters:** Sufficient color contrast helps important information stand out better, especially for low vision readers.
- Color cannot be the only means of conveying information. You can also use object shape, extra markings (like underlines or Unicode symbols), object textures (like striped and dot patterns), text labels, or more. Redundancy provides you and your notebook readers important fallbacks for errors you might not expect.
  - **Why it matters:** If a reader cannot process color, if the reader has low vision, or if the notebook has any issues loading on the reader’s computer, color can easily become lost. If there are more opportunities for the reader to gain information than just the color chosen, then it ensures any color-related issues are not catastrophic for the notebook’s meaning.
- Provide text labels for elements of the interactive area, especially prioritizing those where user input/interactions are needed.
  - **Why it matters:** Text does not rely on any shared language between the reader and author other than the one they are (likely) already using somewhere else in the notebook. Text is also transformable, meaning true text (not in an image) can be read aloud, translated to Braille, or translated into another language.
- Explain the relevance and/or how it’s made and/or how to use it before showing the interactive area.
- **Why it matters:** This ensures that people reading the notebook understand what they are operating and what is being asked of them. It also ensures that there is a contextual fallback in case the interactive area cannot be used or errors out.

### Audio and video recordings

- Audio recordings need a transcription of their contents. If it contains spoken words, those words must be in the transcript. If it contains no words, consider what information is required to understand its relevance to the rest of the notebook. For example, the same song linked in a notebook for a music appreciation class might need to note elements of the song that are relevant to the lecture, while a notebook tutorial about linking audio via code cell might only need to describe the title and artist of that song. Context is key.
  - **Why it matters:** Audio is a way of communicating that relies on hearing. If clear hearing is not possible—whether because the reader is deaf, hard of hearing, or in a noisy environment—the information is totally lost. Transcriptions provide another way of accessing the same information so it remains accessible.
- Video recordings need captions. If at all possible, do not use autogenerated ones. If a video does not have captions, do not use it.
  - **Why it matters:** Videos often have audio elements. Audio is a way of communicating that relies on hearing. If clear hearing is not possible—whether because the reader is deaf, hard of hearing, or in a noisy environment—the information is totally lost. Captions provide another way of accessing the same information so it remains accessible in time with the video’s visuals.
- Video recordings may need transcripts. If at all possible, not a purely autogenerated one. The more talking a video has, the greater the need for a transcript. Having captions does not mean a transcript cannot also be provided.
  - **Why it matters:** Videos often have audio elements. Audio is a way of communicating that relies on hearing. If clear hearing is not possible—whether because the reader is deaf, hard of hearing, or in a noisy environment—the information is totally lost. Transcriptions provide another way of accessing the same information so it remains accessible.
- Video recordings cannot flashing lights. If you have no other option, there needs to be a warning before the video is linked that it has flashing lights; it is far better to exclude it outright.
  - **Why it matters:** Flashing lights at this threshold are known to cause seizures, migraines, and related physical harm. The consequences are serious. Do not ignore this issue in your own or others’ work.

### Other content

Notebooks can hold all sorts of content; they are often testaments to the creativity of their authors! This malleability is certainly one of the notebooks’ strengths, but it also means it is easy to make a notebook with content types not covered above. If you don’t find what you are searching for in the above recommendations, here are ideas of what you can try next.

- **Identify the parts that make up the whole of your unique content and approach their accessibility first.** Many times unusual content is a composite of more common content types interacting with each other in uncommon ways. For example, if your multidimensional, annotated floodplain maps have images of the locations in their annotations, take care of those images with the usual image recommendations first.
- **Find the nearest similar type of content.** Many types of content share traits and can benefit from similar accessibility considerations over none at all. For example, if you are writing a notebook with an interactive timeline that shows how wages in a certain industry have changed over time, it shares time elements with videos and audio recordings. Even if your timeline is neither of these file types, providing a transcript, the ability to stop and start the timeline, and having good contrast will benefit it.
- **Reference WCAG.** WCAG provides more general guidelines for web content and has no specific references to notebooks, but it holds a wealth of information nonetheless. If you are comfortable reading standards documents and figuring out how to apply them to your specific use case, WCAG is a great resource.
- **Reference accessibility considerations in a similar piece of software with an experience you like.** For example, if you embed a whole drawing application in a notebook, you may want to review other drawing applications to explore what accessibility options they have. One of the greatest drawbacks to this approach is that the software you choose may not have accessibility considerations spelled out or may have an experience that doesn’t actually work well for disabled people; it can be a gamble if you haven’t heard feedback about it from an accessibility perspective.
- **Hire disabled testers.** If you are in a situation where you can get user testing, you can do a trial run of your content type and make accessibility changes based on feedback.
- **Change your content to be something standard instead.** This is the most surefire way to provide accessibility considerations for content in a notebook.

## Ideas For Accountability

Recommendations for how to make notebooks more accessible only help if authors commit to taking steps to follow them. But starting new habits—and ensuring that you are starting the right ones—can be difficult! The following ideas are possible options to support notebook authors in practicing these recommendations and sticking with them for the long term.

- Use the checklist in the next section to review your own notebook.
- Find a buddy and trade notebooks for review. This can be done the same way as any other proofreading or involve accessibility tests based on your expertise.
- Use automated accessibility tests in the environment the notebook will be used in. At the time of writing we do not have automated tests to recommend specifically for use on notebook files.
- Try a manual review yourself. Navigate your notebook with only a keyboard, use a screen reader, or zoom in up to 400%. Check if you can still access your whole notebook or if anything is missing. Note: If you don’t use the type of assistive tech you decide to test with on a regular basis, you will not use it like someone who relies on it to work with a computer does. That’s not a bad thing, but remember to keep in mind to check for access to all the information rather than judge whether or not you personally like how it works.
- If possible, consider running user feedback sessions with disabled users and your notebooks. This might be an especially good idea if you are authoring notebooks as a part of a team or larger institution. Remember that giving feedback is work, and users should be compensated accordingly. Resources on how to run feedback sessions can be found at [Notebooks for All User Testing support](https://github.com/Iota-School/notebooks-for-all/tree/main/user-tests/0-support) or you can [reach out to the maintainers of these recommendations at by writing an issue](https://github.com/Quansight-Labs/a11y-playbook/issues/new).

## Checklist

- [ ] The notebook has a distinct file name (not Untitled1)
- [ ] The first cell is a Markdown cell with an H1 (or `#`) for a descriptive notebook title.
- [ ] The first cell has a 1-2 sentence summary of the notebook's contents
- [ ] The first cell has a date authored and/or updated
- [ ] The first cell has the notebook's author(s) and their affiliations.
- [ ] The first cell has a any relevant sources or links related to the notebook's contents
- [ ] The notebook has a table of contents
- [ ] The notebook table of contents is labeled. Preferably with a heading level or landmark.
- [ ] Markdown headings are used and used consistently throughout the notebook
- [ ] Markdown headings are used in order (1–6) without skipping levels
- [ ] Only one Markdown heading level 1 is used per notebook.
- [ ] Notebook text is written in plain language where appropriate. Specialized language is only used when needed.
- [ ] Markdown formatting is used as described in the Markdown syntax being used.
- [ ] If authors have control over it, text has sufficient color contrast to be read.
- [ ] Acronyms are defined at least the first time they are used in the notebook. They may be written in full or linked to a reliable definition.
- [ ] Specialized terms relevant to the notebook are defined, whether written out or linked to a reliable definition.
- [ ] If authors have control over the syntax highlighting theme in the notebook, one with sufficient color contrast is used.
- [ ] Places where color is meaningful have non-color ways to communicate that meaning. For example, errors are labeled in text as errors and not only colored red.
- [ ] Code blocks in the notebook are introduced with their relevance and what they will do.
- [ ] Code styling is used consistently across the notebook.
- [ ] All link text in the notebook is descriptive; readers can tell what opening the link will do.
- [ ] All link text has a non-color indicator to signify it is a link. This could be an underline.
- [ ] All images have image descriptions.
- [ ] Images that are decorative have an image description tag even if its contents are empty.
- [ ] All text found in images is represented somewhere else in the notebook, whether an image description or notebook text.
- [ ] Image contents have sufficient color contrast to be read.
- [ ] Color in the notebook, image or otherwise, is not the only way meaning is communicated.
- [ ] Animations in images, videos, or interface states do not flash three times per second or more.
- [ ] All data visualizations have their source data linked where readers can access.
- [ ] All data visualizations are complete with titles, labeled axes or equivalent, and any other elements specific to the visualization type.
- [ ] All data visualization's relevance and any interactions it can initiate are described before the visualization.
- [ ] Use language and terms that match the notebook's in the data visualizations where appropriate.
- [ ] Data visualizations do not rely only on color coding to communicate their information.
- [ ] Interactive areas all have text labels for their interactive components
- [ ] Audio recordings in the notebook have transcription available.
- [ ] Videos in the notebook have captions available.
- [ ] Videos in the notebook have transcription available.
- [ ] Notebooks follow any other relevant accessibility requirements, whether institutional, project-related, or web standard related.

## Glossary

- **accessibility:** Describes efforts, policy, and mechanisms intended to make a world where people have access to the same information, resources, and experiences as those with different or no disabilities. Disability is at the center of accessibility. In the case of notebook author's work, this is all digital and often only web accessibility—a subset that scopes efforts to make digital interfaces, like the internet, useful and enjoyable for people with disabilities.
- **alt text:** Term commonly used in place of image description. It comes from the HTML element `image`'s image description property called `alt` whose valid input is a text string where image descriptions are meant to go. While alt text has become a general term for all image descriptions, there may be situations where the `alt` property is not or cannot used to provide an image description, so the terms are not entirely interchangable.
- **assistive technology:** Refers to additional tools—physical or digital— that are made specifically to help disabled people interact with the world. In the context of this guide tools like screen readers (software that dictates the contents of and ways to interact with digital devices verbally), screen magnifiers (physical or software devices that englarge visible objects), joysticks (alternative input to mouse and keyboard), Braille displays, dictation software (speech operating the mouse and keyboard), and the like are the most relevant for interacting with digital things like notebook files.
- **captions:** Text describing the audio in a video a few lines at a time, synchronized with the audio and overlaying the video. Sometimes used interchangably with the terms closed captioning, subtitles, or audio descriptions though they all describe slightly different things.
- **cell (notebook cell):** The unit that makes up the contents of a notebook file. Cells are a part of the file format and include information about what is in them and how to handle it, for example if the cell contains narrative text versus runnable code. All notebooks have at least one cell. Most notebooks have several cells.
- **code block:** In Markdown, [blocks](https://spec.commonmark.org/0.31.2/#blocks-and-inlines) refer to paragraph-level content. Code blocks are paragraph-like chunks of code that can stand on their own. As they are a Markdown feature and appear only in notebooks as a part of Markdown cells, code blocks are not in a runnable state.
- **code cell:** A unit of the notebook file that is meant to hold runnable code. Before it is run the code cell appears like others in the notebook. Once the code cell is run, it will have input and output sections documenting what was run and what the results were.
- **compliance (accessibility):** In accessibility contexts, compliance usually refers to legal compliance with the accessibility and disability related laws your work is subject to. This varies greatly on what the work is, what context it is made for, and where you are in the world.
- **flashing (lights and/or colors):** The term used to describe quick, abrupt changes in light, color, or contrast that are known to cause seizures and other harm. More resources on what constitutes flashing content, how to avoid it, and how to test it can be found on the [WCAG Understanding pages](https://www.w3.org/WAI/WCAG21/Understanding/three-flashes-or-below-threshold.html).
- **headings (h1-h6):** [The HTML section elements](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/Heading_Elements) for structuring and and naming documents. These are also available in Markdown and in the notebook's Markdown cells.
- **HTML:** [HyperText Markup Language](https://developer.mozilla.org/en-US/docs/Web/HTML). One of the main code languages underpining all the Internet. Its role is to structure and determine the contents on a webpage. Because HTML is ubiquitous, established, and robust, it is also the language that provides much of the web's accessibility support through HTML's own features or assistive technology's ability to interface with HTML.
- **image description:** Text that describes the contents of an image, especially the information the image adds or information that is needed to understand the content surrounding the image. Image descriptions take the place of images when an image cannot be seen or understood, whether because a person cannot see it or because the image will not load. Alt text is a term commonly used in place of image description.
- **inline code:** In Markdown, [inlines](https://spec.commonmark.org/0.31.2/#blocks-and-inlines) refer to contents within a paragraph-level unit. Inline code are sections that are labeled as code but do not stand on their own, similar to a word or sentence as a part of a larger paragraph. As they are a Markdown feature and appear only in notebooks as a part of Markdown cells, inline code is not in a runnable state.
- **interactive computing:** A term for a field of computer science where the computer and the person using it communicate in real-time while the code is running, sometimes compared to a conversation. The underlying infrastructure of Jupyter notebooks is built on this concept.
- **Jupyter notebook (file):** An open-source file format maintained by Project Jupyter that combines narrative text, runnable code, and flexible file contents. It is popular in a number of fields and in higher education. It is not the same as the Jupyter Notebook application.
- **Markdown cell:** A unit of the notebook file that is meant to hold narrative text and related contents as supported by Markdown. Running a Markdown cell renders the Markdown as HTML.
- **open source:** Source code and related resources that are shared publicly, often with the intent that others will use, edit, and redistribute it. There is a wide variety of open source projects, expectations, and etiquette.
- **output cell:** Short for code output cell. A unit of the notebook file that appears after a code cell has been run showing the results of that run. In most interfaces it is labeled with a number to show the order cells have been run.
- [**plain language:**](https://www.plainlanguage.gov/about/definitions/) A writing style that emphasizes using elements like familiar words, limiting use of industry terms, shorter sentences, and active voice to aid in clear communication.
- **syntax highlighting:** A common visual styling for coding that color codes based on the programming language used. For example, elements of the code that serve the same function or are a part of the same group may share a color to help highlight patterns.
- **transcript:** Text describing the audio, especially spoken words, in audio or video. Usually in paragraph form, it is not synchronized with the audio and is shown separate from the video. It is often stylized to look similar to a script especially when multiple speakers are involved in the audio.
