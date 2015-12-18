class Contract < ActiveRecord::Base

	belongs_to :subject
validates_presence_of :subject_id 

scope :confirmed, -> {where(terminate: true)}
scope :unconfirmed, -> {where(terminate: false)}


end
