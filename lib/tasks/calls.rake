require File.expand_path(File.dirname(__FILE__) + "/../../config/environment")

namespace :calls do
  desc "Get current calls"
  task(:get) do
    @calls=Call.all
    data = Array.new
    rawdata =  %x(/bin/meetmestat)
    rawdata.split("\n").each do |data|
       Call.create(raw: data) if !Call.find_by_raw(data)
    end
    @calls.each do |call|
     a=0
      rawdata.split("\n").each do |data|
        a=a+1 if call.raw==data
      end
     Call.find_by_id(call.id).destroy if a == 0
     a=0
    end
  end
end
#end
