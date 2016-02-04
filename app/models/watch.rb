class Watch < ActiveRecord::Base

belongs_to :user
validates_uniqueness_of :subject_id, scope: :user_id



end
