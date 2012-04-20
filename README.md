# HtmlTagger

Several convience methods monkey patched on String to wrap in HTML formatting.

Method chaining is possible, but produces a lot of embedded SPAN tags.

### Wrapper methods that will wrap a string in a span tag with the appropriate attributes:

  * bold
  * italics
  * underline, underscore
  * strikeout
  * oblique
  * color(text_color)
  * subscript
  * superscript
  * class(class_to_set)
  * tag_id(id_to_set)

### These methods are proxied to the method:

  * styles(*list_of_sytles)
  The _list_of_styles_ is a list of strings, which are mentioned above.  The will all go on the same span tag.

### The #styles method can take an optional first argument of a symbol which will determine the block type:

  * styles(:block_type, *list_of_styles) -- :block_type can be :p, :div or :span.  :span is the same as no first argument.

### A link can be created with

  * link(linked_to_url), or an element in the
  * styles('link:linked_to_url', *other_style_elements)

## Exceptions

   * When an attempt to add more than one ID element to the same tag
   * When a block type other than SPAN, DIV, or P is specified
   * When an unknown trait is specified to #styles


## Installation

Add this line to your application's Gemfile:

    gem 'html_tagger'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install html_tagger

## Usage

 Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

[![endorse](http://api.coderwall.com/coyote/endorsecount.png)](http://coderwall.com/coyote)
