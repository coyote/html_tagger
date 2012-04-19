require File.expand_path(File.dirname(__FILE__) + '../../spec_helper')

require 'html_tagger'

describe "HtmlTagger" do

  let(:text) do
    "Text to Markup"
  end

  before(:each) do
  end

  context "HTML String" do

    context "proxy methods for #style" do

      it "linkifes self" do
        text.link('http://localhost:3000/link').should == "<a href=\"http://localhost:3000/link\">#{text}</a>"
      end

      it "makes self bold" do
        text.bold.should == "<span style=\"font-weight:bold\">#{text}</span>"
      end

      it "italicizes self" do
        text.italics.should == "<span style=\"font-style:italic\">#{text}</span>"
      end

      it "obliquizes self" do
        text.oblique.should == "<span style=\"font-style:oblique\">#{text}</span>"
      end

      it "underlines self" do
        text.underline.should == "<span style=\"text-decoration:underline\">#{text}</span>"
      end

      it "colorizes it red" do
        text.color('red').should == "<span color=\"red\">#{text}</span>"
      end

      it "adds the class 'foo'" do
        text.add_class('foo').should == "<span class=\"foo\">#{text}</span>"
      end

      it "adds a style to bold and italicize" do
        text.add_style("font-weight:bold; font-style:italic").should == "<span style=\"font-weight:bold; font-style:italic\">#{text}</span>"
      end

      it "strikes out text" do
        text.strikeout.should == "<span style=\"text-decoration:line-through\">#{text}</span>"
      end

      it "makes self subscript" do
        text.subscript.should == "<span style=\"font-size:xx-small; vertical-align:bottom\">#{text}</span>"
      end

      it "makes self superscript" do
        text.superscript.should == "<span style=\"font-size:xx-small; vertical-align:top\">#{text}</span>"
      end

    end

    context "it can add multiple stylings at once." do

      it "adds style elements" do
        text.styles('bold','italics').should == "<span style=\"font-weight:bold; font-style:italic\">Text to Markup</span>"
      end

      it "can add color as well as style elements" do
        text.styles('color:red','bold').should == "<span style=\"font-weight:bold\" color=\"red\">Text to Markup</span>"
      end

      it "can add ID, color, and style elements" do
        text.styles('id:foo','color:green','underscore').should == "<span style=\"text-decoration:underline\" color=\"green\" id=\"foo\">Text to Markup</span>"
      end

      it "can add class, ID, and style elements" do
        text.styles('id:bar', 'color:orange', 'bold', 'class:baz').should == "<span class=\"baz\" style=\"font-weight:bold\" color=\"orange\" id=\"bar\">Text to Markup</span>"
      end

      it "can add many classes while adding styles" do
        text.styles('bold','class:foo','class:bar').should ==  "<span class=\"foo bar\" style=\"font-weight:bold\">Text to Markup</span>"
      end

    end

    context "block tag selection" do

      it "allows selection explicitly using :span for <SPAN> tag" do
        text.styles(:span, 'bold').should match /^<span/
      end

      it "allows selection explicitly using :div for <DIV> tag" do
        text.styles(:div, 'bold').should match /^<div/
      end

      it "users a <SPAN> tag when no block element is specified." do
        text.styles('bold').should match /^<span/
      end

    end

    context "exceptions" do


      it "raises an exception when trying to add an unknown trait" do
        lambda { text.styles('boo')}.should raise_error  RuntimeError
      end

      it "raises an error when trying to add more than one ID to the element." do
        lambda { text.styles('id:foo', 'id:bar')}.should raise_error RuntimeError
      end

      it "raises an exception on an unsupported block tag type" do
        lambda { text.styles(:foo, 'bold')}.should raise_error RuntimeError
      end


    end


  end

end
