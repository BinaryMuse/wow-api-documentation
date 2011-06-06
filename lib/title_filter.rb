# This filter assigns a title to the item equal to the first line of text
# in the current representation, if and only if a title is not already set.
class TitleFilter < Nanoc3::Filter
  identifier :title
  type       :text

  def run(content, params={})
    @item[:title] = content.split("\n").first.strip unless @item[:title]
    content
  end
end
