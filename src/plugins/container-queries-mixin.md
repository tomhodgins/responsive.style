# Container Queries Mixin

This JavaScript function lets you define a ‘container’ using a CSS selector, run a JavaScript test against matching tags that match the container’s selector, and to apply a CSS rule to that container or its children.

## Syntax

```javascript
container(selector, test, childSelector, rule)
```

- `selector` is a CSS selector
- `test` is a JavaScript test that evaluates to `true` or `false`
- `childSelector` is a CSS selector
- `rule` is one or more CSS declarations separated by semicolons

## Example

Input:

```javascript
container('div', 'this.offsetWidth > 500', 'span', 'background: lime;')
```

Output:

```css
/* div(this.offsetWidth > 500) span */
[data-container-unique="0"] span {
  background: lime;
}
```

## Code

Rule version:

```javascript

function container(selector, test, childSelector, rule) {

  var tag = document.querySelectorAll(selector)
  var style = ''
  var count = 0

  for (var i=0; i < tag.length; i++) {

    var attr = (selector+test).replace(/\W+/g, '')

    var func = new Function('return ' + test)

    if (func.call(tag[i])) {

      tag[i].setAttribute('data-container-' + attr, count)

      var container = '[data-container-' + attr + '="' + count + '"]'

      style += '\n/* ' + selector + '(' + test + ') ' + childSelector + ' */\n'
               + container + ' ' + childSelector + ' {\n'
               + '  ' + rule + '\n'
               + '}\n'

      count++

    } else {

      tag[i].setAttribute('data-container-' + attr, '')

    }

  }

  return style

}
```

Stylesheet version (using `$this` as a keyword for matching tags):

```javascript
function container(selector, test, stylesheet) {

  var tag = document.querySelectorAll(selector)
  var style = ''
  var count = 0

  for (var i=0; i<tag.length; i++) {

    var func = new Function(`return ${test}`)
    var attr = (selector+test).replace(/\W+/g, '')

    if (func.call(tag[i])) {

      tag[i].setAttribute(`data-${attr}`, count)

      var css = stylesheet.replace(/\$this/g, `[data-${attr}="${count}"]`)

      style += css

      count++

    } else {

      tag[i].setAttribute(`data-${attr}`, '')

    }

  }

  return style

}
```

## Techniques Capable

- [Style Scoping](../techniques/style-scoping.html)
- [Element Queries](../techniques/element-queries.html)
- [Container Queries](../techniques/container-queries.html)
- [Using an Element’s Width](../techniques/element-width.html)
- [Using an Element’s Height](../techniques/element-height.html)
- [Using an Element’s Text Characters](../techniques/element-characters.html)
- [Using an Element’s Child Elements](../techniques/element-children.html)
- [Using an Element’s Scroll Position](../techniques/element-scroll.html)
- [Using an Element’s Aspect Ratio](../techniques/element-aspect-ratio.html)
- [Using an Element’s Orientation](../techniques/element-orientation.html)
- [Selecting the First Element Matching a Selector](../techniques/first-selector-in-document.html)
- [Select an Element by a Child it Contains](../techniques/child-element.html)
- [Select an Element by Text Content](../techniques/text-content.html)
- [Select Void Tags When Empty](../techniques/empty-void-tags.html)
- [Select Elements with a Partial Tag Name](../techniques/partial-attribute-name-match.html)
- [Select Elements with a Partial Attribute Name](../techniques/partial-tag-name-match.html)
- [Compare Attribute Values as Numbers](../techniques/number-comparisons-for-attribute-values.html)

## Links

- [Source Code on Github](https://github.com/tomhodgins/reprocss/blob/master/mixins/container-queries.js)
- [Container Queries Mixin Demo](https://tomhodgins.github.io/reprocss/test/container-queries-mixin.html)