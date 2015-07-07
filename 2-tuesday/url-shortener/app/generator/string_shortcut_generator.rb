class StringShortcutGenerator
  def initialize
    @letters = "abcdefghijklmnopqrstuvwxyz".split("")
  end

  def generate
    shortcut = random_shortcut
    while !shortcut_unique?(shortcut)
      shortcut = random_shortcut
    end
    shortcut
  end

  private

  def random_shortcut
    shortcut = ""
    5.times do
      shortcut += @letters.sample
    end
    shortcut
  end

  def shortcut_unique?(shortcut)
    true unless Url.find(shortcut: shortcut).nil?
  end
end
