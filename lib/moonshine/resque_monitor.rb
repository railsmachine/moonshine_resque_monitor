module Moonshine
  module ResqueMonitor
    
    def resque_monitor
      configure :resque_monitor => {}
      
      if configuration[:resque_monitor].nil?
        configuration[:resque_monitor] = {}
      end
      
      defaults = {
        :max_time => 0,
        :max_memory => 0,
        :log_file => "/var/log/resque_monitor.log",
        :cron => true
      }
      
      configuration[:resque_monitor].merge!(defaults)
      
      gem 'json',
        :ensure => :installed
            
      file "/usr/local/bin/resque-monitor",
        :ensure => :present,
        :content => template(File.join(File.dirname(__FILE__), '..', '..', 'templates', "resque_monitor.rb.erb")),
        :owner => 'root',
        :mode => '0755'
      
      unless configuration[:resque_monitor][:cron] == false
        
        cron "resque_monitor",
          :command => "/usr/local/bin/resque-monitor #{configuration[:resque_monitor][:max_time] || 0} #{configuration[:resque_monitor][:max_memory] || 0} >> /var/log/resque-monitor.log",
          :user => configuration[:user],
          :minute => '*/5'
        
      else
        cron 'resque_monitor', :command => 'true', :ensure => :absent, :user => configuration[:user]
      end
      
    end
    
  end
end