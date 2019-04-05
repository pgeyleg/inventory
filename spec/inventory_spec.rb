require_relative '../lib/inventory'
RSpec.describe Inventory do
  describe '#receive_items' do
    let(:inventory) { Inventory.new }
    context 'successfully updates inventories' do
      let(:beer) {{ beer: 2 }}
      it 'updates inventory' do
        items = inventory.receive_items([beer])
        expect(items).to eq([beer])
      end
    end
    context 'issue with updating inventories' do
      it 'returns error message to user' do
        beer = { beer: 0 }
        expect { inventory.receive_items([beer]) }.to raise_error(RuntimeError,'Quantity cannot be less than 1')
      end
    end
  end

  describe '#list_items' do
    it 'lists inventory with category with quantity and price' do
     
    end
  end
end
