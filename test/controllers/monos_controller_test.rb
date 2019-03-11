require 'test_helper'

class MonosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mono = monos(:one)
  end

  test "should get index" do
    get monos_url
    assert_response :success
  end

  test "should get new" do
    get new_mono_url
    assert_response :success
  end

  test "should create mono" do
    assert_difference('Mono.count') do
      post monos_url, params: { mono: { abstract: @mono.abstract, author: @mono.author, title: @mono.title, year: @mono.year } }
    end

    assert_redirected_to mono_url(Mono.last)
  end

  test "should show mono" do
    get mono_url(@mono)
    assert_response :success
  end

  test "should get edit" do
    get edit_mono_url(@mono)
    assert_response :success
  end

  test "should update mono" do
    patch mono_url(@mono), params: { mono: { abstract: @mono.abstract, author: @mono.author, title: @mono.title, year: @mono.year } }
    assert_redirected_to mono_url(@mono)
  end

  test "should destroy mono" do
    assert_difference('Mono.count', -1) do
      delete mono_url(@mono)
    end

    assert_redirected_to monos_url
  end
end
