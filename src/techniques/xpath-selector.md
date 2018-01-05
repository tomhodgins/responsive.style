# Using XPath to Select Elements

Many CSS authors may not be familiar with XPath so they will most likely be shocked by the expressive power that XPath selectors allow. XPath is a web standard, and defines a way that nodes in an XML document (and elements in an HTML document) can be described like a unix file system, and provides a syntax (and many built-in utility functions) for selecting nodes by writing a selector that resembled a unix file system path. Unlike CSS which is top-down and never backtracks, XPath selectors all you to move up (to parent and ancestor elements), down, and sideways.

XPath was mainly used for extracting (or transforming) data held in XML documents, or as a way to access information in XML format, and seems to have peaked in usage for that purpose before the popularization of JSON. But recently browsers have gained the ability to evaluate XPath selectors using JavaScript using `document.evaluate()`, which has support in all modern browsers. It's now possible to use XPath selectors in the browser as a way to select elements for the purposes of styling, and while it will _never_ perform (XPath being evaluated by JavaScript, then styles being set) as fast as native CSS, it _does_ extend the expressive range of selectors to almost everything a CSS author could ever hope for.

## Parts Required

Using `document.evaluate` to evaluate an XPath selector and returning the result as an array that can be iterated:

```javascript
var test = '//*'
var element = new Array()

var result = document.evaluate(
               test,
               document,
               null,
               XPathResult.UNORDERED_NODE_SNAPSHOT_TYPE,
               null
             )

for (var i=0; i < result.snapshotLength; i++) {

  element.push(result.snapshotItem(i))

}

/* `element` is an array containing all matched nodes in document */
```

## Plugins Capable

- [XPathy](../plugins/xpathy.html)
- [XPath Selector Mixin](../plugins/xpath-selector-mixin.html)

## Further Reading

- [XPath reference on MDN](https://developer.mozilla.org/en-US/docs/Web/XPath)
- [XPath reference on MSDN](https://msdn.microsoft.com/en-us/library/ms256115(v=vs.110).aspx)
- [XPath tutorials on W3Schools](https://www.w3schools.com/xml/xpath_intro.asp)