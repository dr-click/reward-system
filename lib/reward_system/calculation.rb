# calculation.rb

require_relative 'tree.rb'

module RewardSystem
  class Calculation

    attr_accessor :data_file, :data_list, :recommends_tree, :recommend_scores

    RECOMMENDS, ACCEPTS = ACTIONS = ["recommends", "accepts"]

    def initialize(data_file)
      @data_list = []
      @recommend_scores = {}
      @data_file = data_file
    end

    def execute
      return recommend_scores unless data_file
      read_file_data
      parse_data_list
      recommend_scores.inspect
    end

    #######
    private
    #######

    def read_file_data
      File.open(data_file, "r").each_line do |line|
        @data_list << line.strip
      end
    end

    def data_list?
      data_list.any?
    end

    def parse_data_list
      data_list.each do |data_item|
        parse_data_item(data_item)
      end
    end

    def parse_data_item(item)
      date, time, user, action, invitee =  item.split(" ").map(&:strip)
      create_tree_root(user) unless recommends_tree
      save_item_action(user, action, invitee)
    end

    def save_item_action(user, action, invitee)
      return unless ACTIONS.include?(action)
      case action
      when RECOMMENDS
        save_recommends_action(user, invitee)
      when ACCEPTS
        save_accepts_scores(user)
      end
    end

    def save_recommends_action(user, invitee)
      invitee_tree = recommends_tree.find(invitee)
      unless invitee_tree
        tree = recommends_tree.find(user)
        tree.children << Tree.new(invitee) if tree
      end
    end

    def save_accepts_scores(user)
      tree = recommends_tree.find_parents(user).reverse
      score = 1.0
      tree.each_with_index do |name, i|
        @recommend_scores[name] = @recommend_scores[name].to_f + score
        score = score / 2.0
      end
    end

    def create_tree_root(user)
      @recommends_tree = Tree.new(user) unless recommends_tree
    end
  end
end