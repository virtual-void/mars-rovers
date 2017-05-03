module MarsRovers
  class CommandCenter
    def self.receive_commands(commands, rover)
      commands.each_char do |command|
        rover.receive_command(command)
      end
    end
  end
end
