#!/usr/bin/env ruby
# Functions used in liste
# Daniel Ethridge
# { :list1 => {:i1 => "item1", :i2 => "item2"} }, { :list2 => {:i1 => "item1", :i2 => "item2"} }

Class Lib
  # Creates a new list
  def init()
    unless File.directory?("#{Dir.home}/.liste")
      require 'fileutils'
      FileUtils.mkdir_p("#{Dir.home}/.liste")
    end
    File.open("#{Dir.home}/.liste/main.list", "w")
    puts "New list created in '#{Dir.home}/.liste/main.list'\n\n"
    exit
  end

  # Make a list item and add to the json list file
  def add()
    require 'json'
    
  end

  # Pretty-prints a list's contents
  def disp(listname, style)
    require 'json'
    listfile = File.read("#{Dir.home}/.liste/main.list") rescue init()
    listhash = JSON.parse(listfile)
    bullet = "\u2022"
    check = "\u2714"
    puts listhash[listname]
#    case style
#      when "bullet"
#        
#      when "check"
#        
#      when "number"
#        
#    end
    print "\n"
  end

  # Shortcut the manually edit a list
  def edit_list()
    system "editor #{Dir.home}/.liste/main.list" rescue edit_list()
  end
end
