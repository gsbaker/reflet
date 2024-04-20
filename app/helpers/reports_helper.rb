module ReportsHelper
  def need_color_class(rating)
    color_classes = {
      "Rarely Met" => "need--rare",
      "Sometimes Met" => "need--sometimes",
      "Consistently Met" => "need--consistent"
    }

    color_classes[rating.title]
  end
end
