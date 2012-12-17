class Alert < ActiveRecord::Base
   attr_accessible :operator, :limit, :list_mail, :alert_type_id
   belongs_to :alert_type
end
