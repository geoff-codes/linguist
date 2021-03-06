require_relative "./helper"

class TestMD5 < Test::Unit::TestCase
  include Linguist

  def test_hexdigest_string
    assert_equal "af0ede4f95acad6d331a813dc3904c11", MD5.hexdigest("foo")
    assert_equal "05427b9908edb6995ed76faa23e4471f", MD5.hexdigest("bar")
  end

  def test_hexdigest_symbol
    assert_equal "450c1ae043459546517b3dd2f98250f0", MD5.hexdigest(:foo)
    assert_equal "f06967526af9d7a512594b0a81b31ede", MD5.hexdigest(:bar)

    assert_not_equal MD5.hexdigest("foo"), MD5.hexdigest(:foo)
  end

  def test_hexdigest_integer
    assert_equal "7605ec17fd7fd213fdcd23cac302cbb4", MD5.hexdigest(1)
    assert_equal "097c311a46d330e4e119ba2b1dc0f9a5", MD5.hexdigest(2)

    assert_not_equal MD5.hexdigest("1"), MD5.hexdigest(1)
  end

  def test_hexdigest_boolean
    assert_equal "a690a0615820e2e5c53901d8b8958509", MD5.hexdigest(true)
    assert_equal "fca6a9b459e702fa93513c6a8b8c5dfe", MD5.hexdigest(false)

    assert_not_equal MD5.hexdigest("true"), MD5.hexdigest(true)
    assert_not_equal MD5.hexdigest("false"), MD5.hexdigest(false)
  end

  def test_hexdigest_nil
    assert_equal "35589a1cc0b3ca90fc52d0e711c0c434", MD5.hexdigest(nil)

    assert_not_equal MD5.hexdigest("nil"), MD5.hexdigest(nil)
  end

  def test_hexdigest_array
    assert_equal "4410ec34d9e6c1a68100ca0ce033fb17", MD5.hexdigest([])
    assert_equal "759f28c1d0c20c22e79c91d339855d95", MD5.hexdigest([1])
    assert_equal "9efe07b352dd94cd1cdc9d1a8d054f8f", MD5.hexdigest([1, 2])
    assert_equal "60b1ef7201404f20c3d12f47499c3a1f", MD5.hexdigest([1, 2, 3])
    assert_equal "2f82cdc166616208077ff1dd0a8faeff", MD5.hexdigest([1, 2, [3]])
  end

  def test_hexdigest_hash
    assert_equal "fae8a9257e154175da4193dbf6552ef6", MD5.hexdigest({})
    assert_equal "868ee214faf277829a85667cf332749f", MD5.hexdigest({:a => 1})
    assert_equal "fa9df957c2b26de6fcca9d062ea8701e", MD5.hexdigest({:b => 2})

    assert_not_equal MD5.hexdigest([:b, 2]), MD5.hexdigest({:b => 2})

    assert_equal MD5.hexdigest({:b => 2, :a => 1}), MD5.hexdigest({:a => 1, :b => 2})
    assert_equal MD5.hexdigest({:c => 3, :b => 2, :a => 1}), MD5.hexdigest({:a => 1, :b => 2, :c => 3})
  end
end
