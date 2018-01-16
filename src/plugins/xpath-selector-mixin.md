---
title: XPath Selector Mixin
keywords: XPath, XML path, XPath functions, XPath in CSS, XPath selector, XPath axes, selector, selector resolver, mixin, helper function, plugin
---

This JavaScript function lets you use XPath as a selector for CSS rules.

## Syntax

```javascript
xpath(selector, rule)
```

- `selector` is an XPath selector
- `rule` is one or more CSS declarations separated by semicolons

## Example

Input:

```javascript
xpath('//*', 'border: 1px solid red;')
```

Output:

```css
/*

//* {
  border: 1px solid red;
}

*/
[data-xpath-unique="0"] {
  border: 1px solid red;
}
```

## Code

```javascript
function xpath(selector, rule) {

  var tag = new Array()
  var style = ''
  var count = 0

  var result = document.evaluate(
                 selector,
                 document,
                 null,
                 XPathResult.UNORDERED_NODE_SNAPSHOT_TYPE,
                 null
               )

  for (var i=0; i < result.snapshotLength; i++) {

    tag.push(result.snapshotItem(i))

  }

  for (var j=0; j < tag.length; j++) {

    var attr = selector.replace(/\W+/g, '')

    tag[j].setAttribute('data-xpath-'+attr, count)

    style += '\n/*\n\n' + selector + ' {\n  ' + rule + '\n}\n\n*/\n'
             + '[data-xpath-' + attr + '="' + count + '"] {\n'
             + '  ' + rule + '\n'
             + '}\n'

    count++

  }

  return style

}
```

## Techniques Capable

- [Select the Ancestor of an Element](../techniques/ancestor-of-element.html)
- [Select the Parent of an Element](../techniques/parent-of-element.html)
- [Select the Previous Sibling of an Element](../techniques/previous-sibling-of-element.html)
- [Select an Element by a Child it Contains](../techniques/child-element.html)
- [Select an Element by Text Content](../techniques/text-content.html)
- [Select Void Tags When Empty](../techniques/empty-void-tags.html)
- [Select Elements with a Partial Tag Name](../techniques/partial-tag-name-match.html)
- [Select Elements with a Partial Attribute Name](../techniques/partial-attribute-name-match.html)
- [Compare Attribute Values as Numbers](../techniques/number-comparisons-for-attribute-values.html)
- [Using XPath to Select Elements](../techniques/xpath-selector.html)

## Links

- [Source Code on Github](https://github.com/tomhodgins/reprocss/blob/master/mixins/xpath-selector.js)
- [XPath Selector Mixin Demo](https://tomhodgins.github.io/reprocss/test/xpath-selector-mixin.html)