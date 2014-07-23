require File.expand_path(File.dirname(__FILE__) + "/../../config/environment")

namespace :calls do
  desc "Get current calls"
  task(:get) do
    @calls=Call.all
    @calls.each do |call|
      call.destroy
    end
    rawdata = Array.new
    rawdata =  %x(/bin/meetmestat)
    rawdata.split("\n").each do |data|
      Call.create(raw: data)
    end
  end
end
