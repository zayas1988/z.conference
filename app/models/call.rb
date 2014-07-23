class Call < ActiveRecord::Base
	def drop
		result =  %x(/usr/sbin/asterisk -rx  'channel request hangup #{self.raw}')
	end
end
