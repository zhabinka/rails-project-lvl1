# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/hexlet_code'

class TestTag < Minitest::Test
  def setup
    user = Struct.new(:name, :job, keyword_init: true)
    @user = user.new name: 'John'
  end

  def test_form_build
    expect_with_default_action = '<form action="#" method="post"></form>'
    expect = '<form action="/user" method="post" class="form"></form>'
    actual = HexletCode.form_for @user do |f|
    end

    actual2 = HexletCode.form_for @user, url: '/user', class: 'form' do |f|
    end

    assert_equal actual, expect_with_default_action
    assert_equal actual2, expect
  end

  def test_simple_tag_build
    expect = '<input type="submit" value="Save">'
    assert_equal HexletCode::Tag.build('br'), '<br>'
    assert_equal HexletCode::Tag.build('input', type: 'submit', value: 'Save'), expect
  end

  def test_pair_tag_build
    expect = '<div id="1" class="link">Pair tag</div>'
    assert_equal HexletCode::Tag.build('div', id: '1', class: 'link') { 'Pair tag' }, expect
  end
end
