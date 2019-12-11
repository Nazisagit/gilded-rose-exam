class GildedRose
  @@names = ["Aged Brie", "Backstage passes to a TAFKAL80ETC concert", "Sulfuras, Hand of Ragnaros", "Conjured"]

  def initialize(items)
    @items = items
  end

  def increase_quality_backstage(item)
    if item.quality < 50
      item.quality += 1
      if item.name == @@names[1]
        if item.sell_in < 11 && item.quality < 50
          item.quality += 1
        end
        if item.sell_in < 6 && item.quality < 50
          item.quality += 1
        end
      end
    end
  end

  def reduce_quality_none_sulfaras_conjured(item)
    if item.quality > 0 && item.name != @@names[2] && 
      item.name != @@names[3]
      item.quality -= 1
    end
  end

  def reduce_quality_conjured(item)
    if item.quality > 1 && item.sell_in > 0
        item.quality -= 2
    else
      item.quality -= item.quality
    end
  end

  def reduce_quality_other(item)
    if item.name != @@names[1] && item.name != @@names[2] && 
      item.name != @@names[3] && item.quality > 0 
      item.quality -= 1
    else
      item.quality -= item.quality
    end
  end

  def update_quality
    @items.each do |item|
      if item.name != @@names[0] && item.name != @@names[1]
        reduce_quality_none_sulfaras_conjured(item)
      else
        increase_quality_backstage(item)
      end
      if item.name != @@names[2]
        item.sell_in -= 1
      end
      if item.name == @@names[3]
        reduce_quality_conjured(item)
      end
      if item.sell_in < 0
        if item.name != @@names[0]
          reduce_quality_other(item)
        else
          if item.quality < 50
            item.quality += 1
          end
        end
      end
    end
  end

  def dumb_method
    "nothing in here"
    "whoops forgot to add this"
  end
end
