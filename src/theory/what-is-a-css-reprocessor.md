---
title: What is a CSS Reprocessor?
---

A CSS reprocessor is software that processes (or reprocesses as-needed) CSS code in the web browser after the page has loaded.

CSS reprocessors are used to extend the features and capabilities of CSS by using JavaScript logic to help write styles that CSS alone can’t reach.

There are many ways to reprocess CSS. In general, the parts that must be present for CSS reprocessing to occur:

- **Selector** to match elements in the browser
- **CSS Code** to apply to matching elements (may contain JS-powered features)
- **JavaScript Tests** to determine CSS to render
- **JavaScript Events** to trigger the recalculation of the CSS code

You can express these four parts in a wide variety of syntaxes, some CSS reprocessors are HTML-based and allow you to write JS and CSS in HTML, others are CSS-based and allow you to augment your CSS code with JavaScript-powered features, and you can also write JavaScript-based CSS reprocessors as well and use functions that take in selectors and return rendered CSS code.

In the pages below I’ll try to identify which **Selectors**, **CSS Code**, **JS Tests**, and **JS Events** are required to use each technique, and demonstrate using those parts together in a variety of different syntaxes.