
# Visual Formatting

This chapter will discuss CSS's main weapon of choice, boxes. The CSS *box model* defines how rectangular boxes are to be laid on in your document. As always, I encourage you to cross-reference the details in the [box-model specification](http://www.w3.org/TR/CSS2/box.html), and the [visual formatting model specification](http://www.w3.org/TR/CSS2/visuren.html).

## Box Model Review

Let's review of the CSS box model:

![Box Model](examples/visual/box-model.png "The box model consists of margin, border, padding, and content")\

Taking the example diagram from the inside out we have:

1. Content: The content area contains your text, images, etc.
2. Padding: The content can optionally be surrounded by padding
3. Border: The box optionally can have a visible border
4. Margin: A transparent area that surrounds the box

### Edges

The edges of the above described sections of the box can be further broken down in to top, right, bottom, and left. We can thus describe the top outermost area of content just before the padding starts as the *top content edge*. Similarly, we might describe the bottom-most padding area just before the border as the *bottom padding edge*.

Edges can be shared as per the specification, starting with the padding edge:

> If the padding has 0 width, the padding edge is the same as the content edge

Same for borders:

> If the border has 0 width, the border edge is the same as the padding edge

And for margins:

> If the margin has 0 width, the margin edge is the same as the border edge

### Backgrounds

The content and padding background are specified by the containing block's *background* property (and, additionally, any of its children's background properties). Margins are transparent.


