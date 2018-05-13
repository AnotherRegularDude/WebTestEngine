class ApplicationCollectionDecorator < Draper::CollectionDecorator
  delegate :current_page, :total_pages

  def links
    { total_count: object.total_count, current_page: object.current_page, total_pages: object.total_pages }
  end
end
