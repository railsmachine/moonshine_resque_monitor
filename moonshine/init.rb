require 'pathname'
$LOAD_PATH.unshift Pathname.new(__FILE__).dirname.join('..', 'lib').expand_path
require 'moonshine/resque_monitor'

include Moonshine::ResqueMonitor
