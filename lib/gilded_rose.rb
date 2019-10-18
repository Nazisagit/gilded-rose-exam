class GildedRose
  # 1. Created an array to hold the names
  @@names = ["Aged Brie", "Backstage passes to a TAFKAL80ETC concert", "Sulfuras, Hand of Ragnaros"]

  def initialize(items)
    @items = items
  end
  def update_quality
    @items.each do |item|
      if item.name != @@names[0] && item.name != @@names[1]
        if item.quality > 0
          if item.name != @@names[2]
            item.quality = item.quality - 1
          end
        end
      else
        if item.quality < 50
          item.quality = item.quality + 1
          if item.name == @@names[1]
            # 2. Used && to conjoin the if statments
            if item.sell_in < 11 && item.quality < 50
              item.quality = item.quality + 1
            end
            if item.sell_in < 6 && item.quality < 50
              item.quality = item.quality + 1
            end
          end
        end
      end
      if item.name != @@names[2]
        item.sell_in = item.sell_in - 1
      end
      if item.sell_in < 0
        if item.name != @@names[0]
          # 3. Used && to conjoin the if statements
          if item.name != @@names[1] && item.quality > 0 && item.name != @@names[2]
            item.quality = item.quality - 1
          else
            item.quality = item.quality - item.quality
          end
        else
          if item.quality < 50
            item.quality = item.quality + 1
          end
        end
      end
    end
  end
end
