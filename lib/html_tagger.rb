require "html_tagger/version"

class String

  def link(linked_to_url)
    '<a href="'+linked_to_url+'">'+self+"</a>"
  end

  def bold
    add_style('font-weight:bold')
  end

  def color(text_color)
    "<span color=\""+ text_color + "\">" + self + "</span>"
  end

  def italics
    add_style('font-style:italic')
  end

  def oblique
    add_style('font-style:oblique')
  end

  def underscore
    add_style('text-decoration:underline')
  end

  def underline
    underscore
  end

  def strikeout
    add_style('text-decoration:line-through')
  end

  def subscript
    add_style('font-size:xx-small; vertical-align:bottom')
  end

  def superscript
    add_style('font-size:xx-small; vertical-align:top')
  end

  def add_class(added_class)
    '<span class="'+ added_class + '">' + self + "</span>"
  end


  def add_style(style)
    '<span style="' + style + '">' + self + "</span>"
  end


end


