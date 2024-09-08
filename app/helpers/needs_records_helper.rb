module NeedsRecordsHelper
  def need_color_class(rating)
    color_classes = {
      rare: "need--rare",
      sometimes: "need--sometimes",
      consistent: "need--consistent"
    }.stringify_keys

    color_classes[rating.status]
  end
end
