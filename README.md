# Moonshine Resque Monitor

Monitor Resque and kill off "stuck" or bloated workers based on configuration.

## Configuration

In your manifest:

    recipe :resque_monitor

In moonshine.yml:

    :resque_monitor:
      :max_memory: 0 # In megabytes. 0 disables, and is also the default.
      :max_time: 0 # In seconds. 0 disables, and is also the default.
      :cron: true # Set to false if you don't want it to run every 5 minutes.
      

***

Unless otherwise specified, all content copyright &copy; 2014, [Rails Machine, LLC](http://railsmachine.com)