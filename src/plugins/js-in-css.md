---
title: A Simple Pattern for JS-in-CSS
keywords: JS-in-CSS, jsincss, event-driven, virtual stylesheets
---

Below is a simple pattern for JavaScript-in-CSS, where on the following events: load, resize, input, and click, the CSS stylesheet held by this plugin will interpolate the JavaScript contained within it and populate a `<style>` tag on the page with the most up-to-date CSS.

```javascript
window.addEventListener('load', JSinCSS)
window.addEventListener('resize', JSinCSS)
window.addEventListener('input', JSinCSS)
window.addEventListener('click', JSinCSS)

function JSinCSS() {

  var tag = document.querySelector('#JSinCSS')

  if (!tag) {

    tag = document.createElement('style')
    tag.id = 'JSinCSS'
    document.head.appendChild(tag)

  }

  tag.innerHTML = `

    body:before {
      content: '${innerWidth} x ${innerHeight}'
    }

  `

}
```

Click here for a slightly more advanced example featuring debounced execution, plus a mixin for container queries: [PrinCSS](https://gist.github.com/tomhodgins/1b7ac98825ed31afaae972a1b24bc03b)

## Mixin template

The above JS-in-CSS pattern is very easy to extend using JavaScript functions that take in CSS selectors (and also optionally CSS) and figure out which elements the styles should apply to, mark the elements with a unique identifier, and output CSS text that contains the styles that should apply written with selectors that match the unique identifiers the plugin added to the elements in the document. Here's a basic template that can be extended to support many different features:

```javascript
function mixin(selector, rule) {

  // Find tags in document matching selector
  var tag = document.querySelectorAll(selector)

  // Begin with an empty style
  var style = ''

  // Begin counting matching tags at 0
  var count = 0

  // For each tag matching our selector
  for (var i=0; i<tag.length; i++) {

    // Create an identifier based on the selector used
    var attr = selector.replace(/\W+/g, '')

    // Mark tag with a custom attribute containing identifier and count
    tag[i].setAttribute('data-mixin-' + attr, count)

    // Add a copy of the CSS rule to the style using a selector for this tag's unique attribute
    style += '\n[data-mixin-' + attr + '="' + count + '"] {\n'
             + '  ' + rule + '\n'
             + '}\n'

    // Increment the tag counter by +1
    count++

  }

  // Return all generated styles as CSS text
  return style

}
```