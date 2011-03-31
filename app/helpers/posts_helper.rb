module PostsHelper

private
  def disqus_identifier(post)
    if post
      "credulus_post_#{post.id}"
    end
  end
end
