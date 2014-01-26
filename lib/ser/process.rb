module Ser
  class Process
    attr_reader :name, :command

    def initialize(name, command)
      @name, @command = name, command
    end

    def start
      pid = spawn command, out: logfile, err: logfile
      ['log', 'tmp/pids'].each do |dir|
        Dir.mkdir dir unless Dir.exists? dir
      end
      File.write pidfile, pid
    end

    def running?
      ::Process.kill 0, pid
    rescue Errno::ESRCH
      false
    rescue Errno::ENOENT
      false
    end

    def stop
      ::Process.kill 'SIGTERM', pid if running?
    end

    def restart
      stop
      start
    end

    def logfile
      "log/#{name}.log"
    end

    def pidfile
      "tmp/pids/#{name}.pid"
    end

    def pid
      File.read(pidfile).to_i
    end
  end
end
