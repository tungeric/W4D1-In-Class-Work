class Relation
  include Enumerable

  def initialize(collection)
    @collection = collection
  end

  def where(params)

    @collection = @collection.select do |sqlobj|
      params.all? { |col, val| sqlobj[col] == val }
    end

    self
  end

  def each(&prc)
    @collection.each { |sqlobj| prc.call(sqlobj) }
  end

  def length
    @collection.length
  end

  def [](idx)
    @collection[idx]
  end

end
