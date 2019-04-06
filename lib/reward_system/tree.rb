# tree.rb

module RewardSystem
  class Tree
    attr_accessor :name, :children

    def initialize(name)
      @name = name
      @children = []
    end

    def find(key)
      return self if name == key
      children.each do |child|
        return child.find(key)
      end
      return nil
    end

    def find_parents(key)
      parents = []
      return parents if parents.any? || name == key
      parents << name
      children.each do |child|
        return parents += child.find_parents(key)
      end
      return parents
    end
  end
end