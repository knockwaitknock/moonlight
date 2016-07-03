class Player::Inventory::Equipment::Put::OffService

  # put off an item from a slot
  
  attr_reader :player, :equipment, :item, :item_id, :item_type

  def initialize(player, item)
    @player = player
    @equipment = player.equipment
    @item = item
    @item_id = item.id
    @item_type = "#{item.category.slug}_slot"
  end

  def call
    if is_an_item_wearing?
      put_an_old_item_in_inventory
      clear_slot
      update_stats
      player.save
    end
  end

  private

  def is_an_item_wearing?
    player[item_type] == item_id
  end

  def put_an_old_item_in_inventory
    player.equipment << item_id
  end

  def clear_slot
    player[item_type] = nil
  end

  def update_stats
    Player::STATS.each do |stat_name|
      player.decrement(stat_name.to_sym, item[stat_name])
    end

    player.current_hp = player.hp
  end
end