class TocFilter < Nanoc3::Filter
  identifier :toc
  type       :text

  def run(content, params={})
    "1. TOC\n{:toc}\n\n" + content
  end
end
