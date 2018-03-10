class ApplicationDecorator < Draper::Decorator
  delegate_all

  def self.collection_decorator_class
    ApplicationCollectionDecorator
  end
end
