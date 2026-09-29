import { readFileSync } from 'node:fs';

/** @type {import('myst-common').DirectiveSpec} */
const footerLinksDirective = {
  name: 'footer-links',
  doc: 'Display footer links from a JSON file.',
  options: {
    file: {
      type: String,
      required: true,
      doc: 'Path to the JSON file, relative to the project root.',
    },
  },
  run(data) {
    const footerLinks = JSON.parse(readFileSync(data.options.file, 'utf-8'));
    return Object.entries(footerLinks["links"]).map(
      ([text, url]) => ({
        type: 'grid-item',
        children: [
          {
            type: 'link',
            url: url,
            children: [
              {
                type: 'text',
                value: text
              }
            ]
          }
        ]
      })
    );
  }
};

/** @type {import('myst-common').DirectiveSpec} */
const footerIconsDirective = {
  name: 'footer-icons',
  doc: 'Display footer icons from a JSON file.',
  options: {
    file: {
      type: String,
      required: true,
      doc: 'Path to the JSON file, relative to the project root.',
    },
  },
  run(data) {
    const footerIcons = JSON.parse(readFileSync(data.options.file, 'utf-8'));
    return Object.entries(footerIcons["icons"]).map(
      ([text, url]) => ({
        type: 'grid-item',
        children: [
          {
            type: 'link',
            url: url,
            children: [
              {
                type: 'image',
                url: `/assets/icons/${text}.svg`,
                alt: text
              }
            ]
          }
        ]
      })
    );
    return IconsGrid;
  }
};

/** @type {import('myst-common').MystPlugin} */
const plugin = {
    name: 'Footer Items',
    directives: [footerLinksDirective, footerIconsDirective],
};

export default plugin;
