% This defines the footer of the site, and is not parsed as a regular "page"
% We point to it with the following in `myst.yml`:
% site:
% parts:
% footer: footer.md

% Here we use `grid` to add a basic grid structure to the footer, but we don't use
% :columns: property of the grid-items to set widths; instead they're defined in
% asserts/css/scientific-python.css using the `grid-template-columns` property.

::::::{grid} 1 1 4 4
:class: outer-grid col-screen

<!-- logo -->

:::::{grid-item}
:::{image} assets/images/logo.svg
:width: 60px
:class: footer-logo
:::
:::::

<!-- community description -->

:::::{grid-item}
Community-driven and community-owned initiative dedicated to building a robust, sustainable ecosystem for scientific software in Python.
:::::

<!-- link columns -->

:::::{grid-item}
% This a grid embedded within the outer one, to create nicer
% responsive design experience. This grid will have a single column on narrow screens,
% and fan out into three columns on wide screens. However, it always remains within
% its parent grid column.
::::{grid} 1 1 2 3
:class: footer-links

:::{footer-links}
:file: assets/json/footer_items.json
:::

::::
:::::

<!-- social icon columns -->

:::::{grid-item}
:class: socials

::::{grid} 2 2 3 6
:class: footer-icons

:::{footer-icons}
:file: assets/json/footer_items.json
:::

::::

:::{div .copyright}
© 2026 Learn Scientific Python team. All rights reserved.
:::

:::::
::::::
