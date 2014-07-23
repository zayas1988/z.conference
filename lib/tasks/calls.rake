require File.expand_path(File.dirname(__FILE__) + "/../../config/environment")

namespace :calls do
  desc "Get current calls"
  task(:get) do
    @calls=Call.all
    data = Array.new
    rawdata =  %x(/bin/meetmestat)
    if rawdata
      @calls.each do |call|
        call.destroy
      end
    else
      rawdata.split("\n").each do |data|
         Call.create(raw: data) if !Call.find_by_raw(data)
      end

      @calls.each do |call|
        a=0
        rawdata.split("\n").each do |data|
          a++ if Call.find_by_raw(data)
        end
        call.destroy if a==0
      end

    end
  end
end
