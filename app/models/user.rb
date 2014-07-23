class User < ActiveRecord::Base
  has_many :numbers
  accepts_nested_attributes_for :numbers
  def call
    self.numbers.each do |number|
#     puts self.numbers.
#     for self.numbers.each do |number|
      if number.active == true then
        ff= File.new("/tmp/#{number.num}.call","w")
        ff.puts("Channel: Local/#{number.num}@from-internal
MaxRetries: 0
RetryTime: 600
WaitTime: 30
Context: from-internal
Extension: 1292
Priority: 1
")
        ff.close
        result =  %x(sudo -u asterisk cp /tmp/"#{number.num}".call /var/spool/asterisk/outgoing/)
        puts number.num
end
end
end
end
