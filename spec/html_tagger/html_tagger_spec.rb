require File.expand_path(File.dirname(__FILE__) + '../../spec_helper')

require 'html_tagger'

describe "HtmlTagger" do

  let(:text) do
    "Text to Markup"
  end

  before(:each) do
  end

  context "HTML String" do

    context "instance methods" do

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

  end

end
