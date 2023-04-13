# frozen_string_literal: true

require_relative "hexlet_code/version"
require "minitest/autorun"

module HexletCode
  class Error < StandardError; end

  class Tag
    def self.build(tag, properties={})
      t = [tag]
      properties.map { |key, value| t << "#{key}=\"#{value}\"" }
      if block_given?
        tail = yield
        tail = "#{tail}</#{tag}>"
      end
      "<#{t.join(' ')}>#{tail}"
    end
  end

end

class TestTag < Minitest::Test
  def test_simple_tag_build
    expect =  '<input type="submit" value="Save">'
    assert_equal HexletCode::Tag.build('br'), '<br>'
    assert_equal HexletCode::Tag.build('input', type: 'submit', value: 'Save'), expect
  end

  def test_pair_tag_build
    expect = '<div id="1" class="link">Pair tag</div>'
    assert_equal HexletCode::Tag.build('div', id: '1', class: 'link') { 'Pair tag' }, expect
  end
end
