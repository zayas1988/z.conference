require File.expand_path(File.dirname(__FILE__) + "/../../config/environment")

namespace :calls do
  desc "Get current calls"
  task(:get) do
    @calls=Call.all
    data = Array.new
    rawdata =  %x(/bin/meetmestat)
    if rawdata == nil
      @calls.each do |call|
        call.destroy
      end
    else
      rawdata.split("\n").each do |data|
         Call.create(raw: data) if !Call.find_by_raw(data)
      end
    end
  end
end
