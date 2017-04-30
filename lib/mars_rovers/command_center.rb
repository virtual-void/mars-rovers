module MarsRovers
  class CommandCenter
    def self.send(commands, rover)
      commands.each_char do |command|
        rover.receive_command(command)
      end
    end
  end
end
