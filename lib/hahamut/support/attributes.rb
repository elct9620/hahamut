# frozen_string_literal: true

module Hahamut
  module Support
    # Define attributes API
    module Attributes
      class << self
        def included(other)
          other.extend ClassMethods
        end
      end

      # Define attribute class
      module ClassMethods
        def attribute(name, type)
          name = name.to_sym
          klass = Attribute.const_get(type.to_s.capitalize)

          define_method name do
            @attributes[name]&.value
          end

          define_method "#{name}=" do |value|
            @attributes ||= {}
            @attributes[name] = klass.new(value)
          end
        end
      end

      attr_reader :attributes

      def assign_attributes(attributes)
        attributes.each do |attr, value|
          send("#{attr}=", value)
        end
      end
    end
  end
end
