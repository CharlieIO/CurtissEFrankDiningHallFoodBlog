class BlogPost < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :comments

  def self.filter_on_constraints(constraint_hash)
    records = BlogPost.all
    operator_hash = {
        :location => '==',
        :category => '==',
    }
    constraint_hash.each_pair do |key, value|
      symbol = key.to_sym
      operator = operator_hash[symbol]
      if !operator.nil?
        if !value.to_s.empty?
          records = records.where("#{symbol.to_s} #{operator} ?", value.to_s)
        end
      end
    end
    records
  end
end
