class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :event_groupships
  has_many :groups, :through => :event_groupships

  has_many :comments
  validates_presence_of :name
end



