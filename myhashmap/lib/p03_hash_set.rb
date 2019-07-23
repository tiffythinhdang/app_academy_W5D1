class HashSet
  attr_reader :count, :store

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    return if include?(key)
    self[key] << key
    @count += 1
    resize! if @count >= num_buckets
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    @count -= 1 if include?(key)
    self[key].delete(key)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    bucket_num = num.hash % num_buckets
    @store[bucket_num]
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store
    @store = Array.new(num_buckets * 2) { Array.new }
    old_store.each do |bucket|
      bucket.each do |el|
        self[el] << el
      end
    end
  end
end
