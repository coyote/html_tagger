require "html_tagger/version"

class String

  def link(linked_to_url)
    styles('link:'+linked_to_url)
  end

  def bold
    styles('bold')
  end

  def color(text_color)
    styles('color:'+text_color)
  end

  def italics
    styles('italics')
  end

  def oblique
    styles('oblique')
  end

  def underscore
    styles('underline')
  end

  def underline
   styles('underline')
  end

  def strikeout
    styles('strikeout')
  end

  def subscript
    styles('subscript')
  end

  def superscript
    styles('superscript')
  end

  def add_class(added_class)
    styles('class:'+added_class)
  end

  def styles(*styles)

    tag_attrs = {}

    supported_wrapper_tags = ['span', 'div']

    wrap_tags = { 'before' => [], 'after' => []}

    block = 'span'

    if (styles.first.is_a?(Symbol))  # specify block type
      block = styles.first.to_s
      raise "Supported wrapper tags are "+ supported_wrapper_tags.join(' and ') unless supported_wrapper_tags.include?(block)
      styles.shift
    end

    styles.reverse.each do |styl|

      case styl
        when /^id:(.+)/
          raise "Only one ID allowed for an element." if tag_attrs['id']
          tag_attrs['id']     = $1
        when /^link:(.+)/
          wrap_tags['before'] <<  "<a href=\"#{$1}\">"
          wrap_tags['after']  = ['</a>'] + wrap_tags['after']
        when /^class:(.+)/
          tag_attrs['class']  = $1 + (tag_attrs['class'].nil? ? '' : ' ' + tag_attrs['class'])
        when /^color:(.+)/
          tag_attrs['color']  = $1     # first wins if specified > 1 time
        when 'bold'
          tag_attrs['style']  = 'font-weight:bold; '                          + tag_attrs['style'].to_s
        when /^italics?$/
          tag_attrs['style']  = 'font-style:italic; '                         + tag_attrs['style'].to_s
        when /^under(line|score)$/
          tag_attrs['style']  = 'text-decoration:underline; '                 + tag_attrs['style'].to_s
        when 'oblique'
          tag_attrs['style']  = 'font-style:oblique; '                        + tag_attrs['style'].to_s
        when /^strike(out|through)$/
          tag_attrs['style']  = 'text-decoration:line-through; '              + tag_attrs['style'].to_s
        when 'subscript'
          tag_attrs['style']  = 'font-size:xx-small; vertical-align:bottom; ' + tag_attrs['style'].to_s
        when 'superscript'
          tag_attrs['style']  = 'font-size:xx-small; vertical-align:top; '    + tag_attrs['style'].to_s
        else
          raise "Unexpected style element."
      end

    end

    block_wrapper = ''
    block_closer = ''
    unless tag_attrs.empty?
      block_wrapper = '<' + block  +  ' ' +
          tag_attrs.keys.inject(''){ |accum, html_attr| accum +  html_attr + '="' + tag_attrs[html_attr].chomp('; ') + '" '}.chomp(' ')   + '>'
      block_closer = '</' + block + '>'
    end
    wrap_tags['before'].join +  block_wrapper + self + block_closer + wrap_tags['after'].join

  end

  ## compat with 0.0.1 gem
  def add_style(style)
    '<span style="' + style + '">' + self + "</span>"
  end


end


