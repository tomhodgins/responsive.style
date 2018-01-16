---
title: Selecting Elder Siblings of an Element
keywords: selector, css selector, selector resolver, elder siblings, css older, css elder, css sibling, previous element
---

CSS is able to select elements, the junior siblings of elements, and the children of elements, but it cannot select the elder siblings of elements.

The need for this is rare, but falls totally outside the scope of what CSS is designed to do. If you need the ability to style the elder siblings of an element you'll likely need to rely on JavaScript to help.

## Parts Required

The key to being able to style elder siblings is to be able to compare the position to two elements in HTML within their parent element as numbers. If we can use JavaScript to find the index of the element in question we can compare it against the index of all of the children of the parent element and apply styles.

### JS Tests

```javascript
function logElder(selector) {

  var element = document.querySelector(selector)

  var child = element.parentNode.querySelectorAll('*')

  var selectorIndex = [].indexOf.call(child, element)

  child.forEach(function(tag) {

    var tagIndex = [].indexOf.call(child, tag)

    if (tagIndex < selectorIndex) {

      // do stuff
      console.log(tag)

    }

  })

}
```

## Syntax Examples

### Elder Sibling Mixin

```javascript
elder('.demo', 'background: lime;')
```

## Plugins Capable

- [Elder Selector Mixin](../plugins/elder-selector-mixin.html)

## Demos

- [Elder Selector Mixin Demo](https://tomhodgins.github.io/reprocss/test/elder-selector-mixin.html)