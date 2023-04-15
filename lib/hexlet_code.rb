# frozen_string_literal: true

require_relative 'hexlet_code/version'
require 'minitest/autorun'

module HexletCode
  class Error < StandardError; end

  def self.form_for(_, attributes = {})
    attr = {}
    attr[:url] ||= '#'
    attr[:method] = 'post'
    attr.merge!(attributes)
    attr.transform_keys! { |key| key == :url ? :action : key }

    # attr = attributes.transform_keys do |key|
    #   key == :url ? :action : key
    # end.merge({ method: 'post' })

    Tag.build('form', attr) {}
  end

  class Tag
    def self.build(tag, attributes = {})
      attr = []
      attributes.each { |key, value| attr << %( #{key}="#{value}") }
      if block_given?
        content = yield
        closing_tag = "</#{tag}>"
      end
      "<#{tag}#{attr.join}>#{content}#{closing_tag}"
    end
  end
end
