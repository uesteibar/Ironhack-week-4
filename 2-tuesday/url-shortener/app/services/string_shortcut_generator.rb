class StringShortcutGenerator
  def initialize(length)
    @length = length
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
    @length.times do
      shortcut += @letters.sample
    end
    shortcut
  end

  def shortcut_unique?(shortcut)
    true unless Url.find_by(shortcut: shortcut)
  end
end
