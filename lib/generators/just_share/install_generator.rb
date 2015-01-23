require 'colorize'
module JustShare
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)
      
      desc "It automatically create it JustShare initializer rails app config"
      
      def copy_initializer
        template "just_share.rb", "config/initializers/just_share.rb"
        puts 'Check your config/initializers/just_share.rb & read it comments'.colorize(:light_yellow)
      end
      
    end
  end
end