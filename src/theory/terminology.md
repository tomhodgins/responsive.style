---
title: CSS Reprocessing Terminology
description: Terms and concepts used in CSS reprocessing and JS-in-CSS plugins explained.
---

<dl>

<dt>CSS Reprocessor
<dd>Software that processes (or reprocesses on an as-needed basis) CSS code in the browser after the page loads.

<dt>Element Queries
<dd>Element queries are scoped styles with responsive breakpoints set to properties of the individual elements they are styling.

<dt>Meta-Selector
<dd>A meta-selector describes the relationship between the element in the scope of a scoped style and elements around it in the DOM.

<dt>Scoped Styles
<dd>Scoped styles refer to three ideas:
- stylesheets that depend on logic to apply (container queries)
- styles that apply only to elements that pass a test (element queries, scoped styles)
- the ability to use JavaScript properties of elements for styling purposes (scoped values, scoped units)

<dt>Selector Resolver
<dd>A Selector Resolver is a selector that depends on a test (usually in JavaScript) to determine which elements in the document a style should apply to.

<dt>Virtual Stylesheet
<dd>A `<style>` tag that contains the rendered output of a stylesheet comprised of JavaScript logic in addition to CSS, with recalculations triggered by events happening in the browser.

</dl>