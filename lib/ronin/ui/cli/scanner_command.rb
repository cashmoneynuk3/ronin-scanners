#
# Ronin Scanners - A Ruby library for Ronin that provides Ruby interfaces to
# various third-party security scanners.
#
# Copyright (c) 2008-2011 Hal Brodigan (postmodern.mod3 at gmail.com)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
#

require 'ronin/ui/cli/command'
require 'ronin/database/migrations/scanners'
require 'ronin/database'

module Ronin
  module UI
    module CLI
      class ScannerCommand < Command

        class_option :database, :type => :string, :aliases => '-D'
        class_option :first, :type => :numeric, :aliases => '-N'
        class_option :import, :type => :boolean, :aliases => '-I'

        #
        # The Scanner class with the same name as the command.
        #
        # @return [Class]
        #   The Scanner class, loaded from {Ronin::Scanners}.
        #
        # @api semipublic
        #
        def self.scanner
          @scanner ||= Scanners.const_get(name.split('::').last)
        end

        #
        # Invokes the scanner.
        #
        # @see #scan!
        #
        # @api semipublic
        #
        def execute
          scan!
        end

        protected

        #
        # Sets up the scanner command.
        #
        # @api semipublic 
        #
        def setup
          super

          if self.options[:database]
            Database.repositories[:default] = options[:database]
          end

          Database.setup

          @scanner = self.class.scanner.new

          # populate parameters with command options
          @scanner.params = options

          # populate additional parameters that map to arguments
          self.class.arguments.each do |argument|
            if @scanner.has_param?(argument.name)
              @scanner.get_param(argument.name).value = send(argument.name)
            end
          end
        end

        #
        # Performs a scan using the `@scanner` instance variable.
        #
        # @since 1.0.0
        #
        def scan!
          enum = if options.save?
                   @scanner.import
                 else
                   @scanner.each
                 end

          enum.each_with_index do |result,index|
            if result.kind_of?(DataMapper::Resource)
              print_resource(result)
            else
              print_result(result)
            end

            break if (options[:first] && index+1 == options[:first])
          end
        end

        #
        # Displays a result from the scanner.
        #
        # @param [Object] result
        #   A result yielded from the scanner.
        #
        # @since 1.0.0
        #
        def print_result(result)
          puts result
        end

        #
        # Displays a resource from the scanner.
        #
        # @param [Model] resource
        #   A resource yielded from the scanner.
        #
        # @since 1.0.0
        #
        def print_resource(resource)
          puts resource
        end

      end
    end
  end
end
