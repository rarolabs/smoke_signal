class AlertType < ActiveRecord::Base
   attr_accessible :alert_ids, :title, :description, :key, :system_id
   has_many :alerts
   belongs_to :system
end
