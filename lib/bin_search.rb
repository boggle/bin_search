require 'rubygems'

require 'bin_search/version'

module BinSearch

  def self.files
    f = []
    f << 'bin_search/bin_search'
    f
  end

  def self.load_relative(f)
    path = "#{File.join(File.dirname(caller[0]), f)}.rb"
    load path
  end

  def self.reload!
    files.each { |f| load_relative f }
  end

end

BinSearch.files.each { |f| require f }