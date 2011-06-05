require 'heredoc_unindent'

class BlizzquoteFilter < Nanoc3::Filter
  identifier :blizzquote
  type       :text

  def run(content, params={})
    regex       = /<p>\[BLIZZQUOTE (.*) (.*)\]\n(.*)\n\[\/BLIZZQUOTE\]<\/p>/m
    replacement = <<-END.unindent
      <div class="blizzquote">
        <div class="author">
          <span>Posted by <strong>\\1</strong> at
          <a href="\\2">\\2</a></span>
        </div>
        <div class="content">
          <p>\\3</p>
        </div>
      </div>
    END

    content.gsub regex, replacement
  end
end
