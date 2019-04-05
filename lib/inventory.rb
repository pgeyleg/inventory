class Inventory
  def initialize 
    @items = []
  end

  def receive_items(inventories)
    inventories.each do |inventory| 
      raise 'Quantity cannot be less than 1' if inventory.values.first < 1 
    @items << inventory 
    end
  end
end
