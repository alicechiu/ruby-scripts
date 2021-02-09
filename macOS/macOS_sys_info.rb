#!/usr/bin/ruby
def general_info
  @user = `whoami`
  @prd_version = `sw_vers -productVersion`
  @sw_version = `sw_vers -buildVersion`
  @sys_mem = `system_profiler SPHardwareDataType | grep Memory`
  @sys_processor = `system_profiler SPHardwareDataType | grep Processors:`
  @batt_info = `pmset -g batt`

  puts "User: #{@user}"
  puts "Product version: #{@prd_version}"
  puts "Software version: #{@sw_version}"
  # puts "#{(@sys_mem.delete('GB')).strip()}"
  puts "System memory: #{@sys_mem[14]}"
  # puts "#{@sys_mem.join(', ')}"
  puts "#{@sys_processor.strip()}"
  puts "Battery info: #{@batt_info}"
end

def sys_compatibility
  if @prd_version.to_f > '10.9'.to_f && @sys_mem.to_i > '4'.to_i
    puts find_pending_update
  else
    puts 'Check general requirements please'
  end
end

# def launch_apps
##   can apps launch successfully
# end

private

def find_pending_update
  @update = `softwareupdate -l`
end

general_info
sys_compatibility
