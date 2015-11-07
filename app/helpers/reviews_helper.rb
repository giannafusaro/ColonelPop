module ReviewsHelper


  def rating_in_stars(review)
    content_tag(:h6) do
      review.rating.times.collect do
        "<i class=\"fa fa-star\"></i>"
      end.join.html_safe +
      (10-review.rating).times.collect do
        "<i class=\"fa fa-star-o\"></i>"
      end.join.html_safe
    end
  end

end
