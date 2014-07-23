class User < ActiveRecord::Base
  has_many :numbers
  accepts_nested_attributes_for :numbers
  def call(user)
    for user.numbers.each do |number|
      if number.active?
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
        result =  %x(sudo -u asterisk cp /tmp/#{number.num}.call /var/spool/asterisk/outgoing/)
      end
    end
  end
end
