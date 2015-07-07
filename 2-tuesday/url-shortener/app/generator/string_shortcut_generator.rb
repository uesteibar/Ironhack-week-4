class StringShortcutGenerator
  def initialize
    @letters = "abcdefghijklmnopqrstuvwxyz".split("")
  end

  def generate
    shortcut = ""
    5.times do
      shortcut += @letters.sample
    end
    shortcut
  end
end
