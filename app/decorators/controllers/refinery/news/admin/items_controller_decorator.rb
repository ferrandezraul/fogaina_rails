# Open the Refinery::Admin::PagesController controller for manipulation
Refinery::News::Admin::ItemsController.class_eval do

  def item_params
    params.require(:item).permit(:title, :body, :content, :source, :publish_date, :expiration_date, :photo_id, :photo2_id)
  end

end