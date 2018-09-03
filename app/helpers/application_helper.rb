module ApplicationHelper
  def get_store_by_id(store_id)
    Store.find(store_id)
  end
end
