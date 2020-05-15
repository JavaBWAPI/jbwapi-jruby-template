$:.unshift Dir.getwd  # add current directory to $LOAD_PATH

require 'lib/jbwapi-1.4.jar'

java_import 'bwapi.DefaultBWListener', 'bwapi.BWClient'

class Bot < DefaultBWListener
  attr_accessor :bwClient, :game

  def onStart
    @game = bwClient.getGame
  end

  def onFrame
    @game.drawTextScreen(100, 100, 'hello world')
  end
end

bot = Bot.new
bot.bwClient = BWClient.new(bot)
bot.bwClient.startGame
